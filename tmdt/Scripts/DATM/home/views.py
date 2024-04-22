import hashlib
import hmac
import json
from django.contrib.auth.models import User
from django.utils import timezone

from home.vnpay import vnpay
from .models import *
from django.shortcuts import render, get_object_or_404, redirect
from django.db.models import Sum
from django.contrib import messages
from .calculations import *
import random

# from django.contrib.sites.shortcuts import get_current_site  
# from django.utils.encoding import force_bytes
# from django.utils.encoding import force_str
# from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode  
# from django.template.loader import render_to_string  
# from .tokens import account_activation_token  
# from django.core.mail import EmailMessage  
# from django.contrib.auth import get_user_model
# from django.http import HttpResponse

from django.http import JsonResponse
from django.views.decorators.http import require_POST
from django.contrib.auth.decorators import login_required

from django.contrib.auth import update_session_auth_hash, authenticate, login, logout
from .forms import *
from django.shortcuts import render, redirect
from django.core.mail import send_mail
from django.template.loader import render_to_string

from django.conf import settings

time = timezone.now()

def send_email(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            # Lấy dữ liệu từ biểu mẫu
            name = form.cleaned_data['name']
            phone_number = form.cleaned_data['phone_number']
            email = form.cleaned_data['email']
            message = form.cleaned_data['message']

            user = request.user
            # Nội dung email
            email_content = f"Name: {name}\nPhone Number: {phone_number}\nEmail: {email}\nMessage: {message}"

            # Gửi email
            send_mail(
                'Contact Form Submission',
                email_content,
                settings.DEFAULT_FROM_EMAIL,
                [settings.DEFAULT_TO_EMAIL],
                fail_silently=False,
            )

            message = Feedback.objects.create(
                user=user,
                email=email,
                phone_number=phone_number,
                message=message,
            )
            message.save()

            # # Chuyển hướng hoặc hiển thị thông báo thành công
            return redirect('homePage')  # Thay 'success_page' bằng tên trang thành công của bạn

    else:
        messages.error("Không tìm thấy Email hợp lệ")
        return redirect('homePage')
    # return render(request, 'your_template.html', {'form': form})


@login_required
def send_user_email(user_email, subject, message):
    try:
        send_mail(
            subject,
            message,
            settings.DEFAULT_FROM_EMAIL,
            [user_email],
            fail_silently=False,
        )
        return True  # Gửi email thành công
    except Exception as e:
        print(f"Error sending email: {e}")
        return False  # Gửi email thất bại
    
# THÊM SẢN PHẨM VÀO GIỎ HÀNG TẠM THỜI CỦA USER
@login_required
def add_to_cart(request):
    try:
        product_id = request.POST.get("product_id")
        print(product_id)
        product = get_object_or_404(Product, pro_id=product_id)
        user = request.user

        # Thêm sản phẩm vào giỏ hàng hoặc tăng số lượng nếu đã tồn tại
        cart_item, created = CartItem.objects.get_or_create(user=user, product=product)
        if not created:
            cart_item.quantity += 1
            cart_item.save()

        # return JsonResponse({"status": "success", "message": "Product added to cart successfully"})
        return redirect('cart_Page')
    except Exception as e:
        print(e)
        return redirect('foodPage')

#CẬP NHẬT SỐ LƯỢNG PRODUCT TRONG ITEM
@login_required
def update_cart(request):
    try:
        if request.method== 'POST':
            user= request.user
            cart_items = CartItem.objects.filter(user= user)

            for cart_item in cart_items:
                selected_quantity = f'quantity_{cart_item.id}'
                newQuantity = int(request.POST.get(selected_quantity,1))
                cart_item.quantity = newQuantity
                cart_item.save()
            # return redirect('your_checkout_url')
        # return JsonResponse({"status": "success", "message": "Updated quantity of product successfully"})
        return redirect(checkOut)
    except Exception as e:
        # return JsonResponse({"status": "error", "message": str(e)})
        print(str(e))
    
# ĐƯA PRODUCTS CỦA USER LÊN VIEW
@login_required
def view_cart(request):
    user = request.user
    cart_items = CartItem.objects.filter(user=user)
    total_items = cart_items.count()
    total_amount = cart_items.aggregate(Sum('product__price'))['product__price__sum']

    context = {
        'cart_items': cart_items,
        'total_items': total_items,
        'total_amount': total_amount,
    }
    return render(request, 'shop/cart_Page.html',context)

@login_required
def checkOut(request):
    user = request.user
    cart_items = CartItem.objects.filter(user=user)
    total_items = cart_items.count()
    total_amount = sum(item.product.price * item.quantity for item in cart_items)
    
    for item in cart_items:
        item.total_price = item.product.price * item.quantity

    context = {
        'cart_items': cart_items,
        'total_items': total_items,
        'total_amount': total_amount,
    }

    return render(request, 'shop/thanhToan_Page.html',context)

#XÓA GIỎ HÀNG CỦA USER KHI THANH TOÁN THÀNH CÔNG
@require_POST
def transaction(request):
    try:
        user = request.user
        cart_items = CartItem.objects.filter(user= user)
        cart_items.delete()
        
        return JsonResponse({"status": "success", "message": "Deleted Items of {user} successfully"})
    except Exception as e:
        return JsonResponse({"status": "error", "message": str(e)})

@login_required
def Dat_hang(request):
    if request.method == 'POST':
        # Lấy thông tin từ form
        user = request.user
        tong_tien = int(request.POST['tong_tien'])
        email = request.POST['email']
        dia_chi = request.POST['address']
        cart_items = CartItem.objects.filter(user=user)

        # Thực hiện giao dịch (Transaction) để đảm bảo tính toàn vẹn dữ liệu
        hoa_don = HoaDon.objects.create(
            user=user,
            tongTien=tong_tien,
            email=email,
            diaChi=dia_chi
        )

        # Lưu chi tiết đơn hàng
        for item in cart_items:
                Detail.objects.create(
                    user= user,
                    hoaDon=hoa_don,
                    product=item.product,
                    quantity=item.quantity
                )

            # Xóa các sản phẩm trong giỏ hàng sau khi đặt hàng thành công
        cart_items.delete()

        # messages.error(request, 'Đơn hàng của bạn đã được đặt thành công! Cảm ơn bạn.')

        # Chèn template thông báo vào context
        # messages_template = render_to_string('partion/message.html', {'messages': messages.get_messages(request)})

        # Chèn template thông báo vào trang homePage.html
        # return render(request, 'shop/homePage.html', {'messages': messages_template})
        return redirect('homePage')
    else:
    # Nếu không phải là phương thức POST, chuyển hướng về trang khác
        # messages.error("Đơn hàng của bạn chưa hoàn thành!")
        # messages_template = render_to_string('partion/message.html', {'messages': messages.get_messages(request)})

        # Chèn template thông báo vào trang homePage.html
        # return render(request, 'shop/homePage.html', {'messages': messages_template})
        return redirect('homePage')


categories = Category.objects.all()
allProduct = Product.objects.all()

def product_detail(request, product_id):
    product = get_object_or_404(Product, pro_id=product_id)
    reviews = Review.objects.filter(product=product).order_by('-created_at')
    print(product)
    context = {
         'product': product,
         'reviews' : reviews
    }
    return render( request, 'shop/productDetail.html',
                context)


def homePage(request):
    newProduct = Product.objects.order_by('-created_at')[:3]
    total_items = 0

    # Kiểm tra xem người dùng đã đăng nhập chưa
    if request.user.is_authenticated:
        cart_items = CartItem.objects.filter(user=request.user)
        total_items = cart_items.count()

    context = {
        'newProduct': newProduct,
        'allProduct': allProduct,
        'total_items': total_items,
        'categories': categories,
    }
    return render(request, 'shop/homePage.html', context)

def product_list_by_category(request, category_name):
    category_object = get_object_or_404(Category, name= category_name)
    products = Product.objects.filter(category= category_object)
    print(products)
    return render(request, 'shop/foodPage.html',
                    {'category': category_object, 'products': products})

def top_3_products():
    top_3_products = Product.objects.annotate(total_quantity=Sum('detail__quantity')).order_by('-total_quantity')[:3]
    return top_3_products

def foodPage(request):
    top3 = top_3_products()
    context = {
        'categories': categories, 
        'allProduct': allProduct,
        'top3'      : top3,
    }
    return render(request, 'shop/foodPage.html', context)

def testFiller(request):
    categories = Category.objects.all()
    allProduct = Product.objects.all()
    return render(request, 'shop/testFiller.html', {'categories': categories, 'allProduct': allProduct})

def aboutPage(request):
    return render(request, 'shop/aboutPage.html')
def contactPage(request):
    return render(request, 'shop/contactPage.html')

def change_password(request):
	if request.method == "POST":
		form = PasswordChangeForm(request.user, request.POST)
		if form.is_valid():
			user = form.save()
			update_session_auth_hash(request, user) 
			messages.success(request, "Mật khẩu của bạn đã được thay đổi thành công.")
			logout(request)
			return redirect('formLogIn')
		else:
			for field, errors in form.errors.items():
				for error in errors:
					messages.error(request, f"{field}: {error}")
	else:
		form = PasswordChangeForm(request.user)
	return render(request, 'shop/capNhat.html', {'form': form})

def logOut(request):
	logout(request)
	return redirect('homePage')

@login_required
def inforCustomer(request):
    user = request.user

    # Lấy danh sách các Detail mà chưa có Review
    details_without_reviews = Detail.objects.filter(user=user).exclude(review__isnull=False)

    context = {
        'details': details_without_reviews,
    }

    return render(request, 'shop/inforCustomer.html', context)

def get_admin():
    admin = User.objects.filter(is_superuser=True).first()
    if admin:
        return{
             'username': admin.username,
             'email': admin.email,
        }
    else:
         return None

def infor_profile(request):
    admin = get_admin()
    get_messages = Feedback.objects.all().order_by('-time')
    context = {
        'admin'        : admin,
        'messages'     : get_messages,
         }
    return render(request, 'pages/profile.html', context)

@login_required
def add_review(request, product_id, hoadon_id, detail_id):
    product = get_object_or_404(Product, pro_id=product_id)
    hoaDon = get_object_or_404(HoaDon, maHoaDon = hoadon_id)
    detail = get_object_or_404(Detail, id = detail_id)
    user = request.user

    if request.method == 'POST':
        # Lấy dữ liệu từ form
        rate = int(request.POST.get('rating', 0))
        content = request.POST.get('opinion', '')

        # Kiểm tra xem người dùng đã đánh giá sản phẩm trước đó chưa
        existing_review = Review.objects.filter(user=user, product=product, hoadon = hoaDon, detail = detail).exists()

        if existing_review:
            messages.error(request, "You have already reviewed this product.")
        else:
            # Tạo đánh giá mới và lưu vào database
            review = Review.objects.create(user=user, hoadon= hoaDon, product=product, rate=rate, content=content, detail = detail)

            review.save()

            messages.success(request, "Thank you for your review!")

        # messages_template = render_to_string('partion/message.html', {'messages': messages.get_messages(request)})

        return render(request, 'shop/inforCustomer.html')
    else:
        return redirect('inforCustomer')
# LẤY REVIEW KHÁCH HÀNG
@login_required
def product_review(request, product_id, hoadon_id):
    user = request.user
    product_id = get_object_or_404(Product, pro_id=product_id)
    hoadon_id = get_object_or_404(HoaDon, maHoaDon = hoadon_id)
    detail = Detail.objects.filter(user = user, hoaDon = hoadon_id, product = product_id).first()
    print(detail)
    return render( request, 'shop/review_Page.html',
                {'detail': detail} )    


def index(request):
    count_customers = count_registered_users_today()
    count_staffs = count_registered_staffs_today()
    doanhThuNgay = calculate_day_revenue()
    doanhThuThang = calculate_monthly_revenue()
    spbanNgay = calculate_daily_products_sold()
    spbanThang = calculate_monthly_products_sold()
    context = {
        'customers_today' : count_customers,
        'staffs_today'    : count_staffs,
        'doanhThuNgay'    : doanhThuNgay,
        'doanhThuThang'   : doanhThuThang,
        'spbanNgay'       : spbanNgay,
        'spbanThang'      : spbanThang,

        }
    return render(request, 'pages/index.html', context)

def hmacsha512(key, data):
    byteKey = key.encode('utf-8')
    byteData = data.encode('utf-8')
    return hmac.new(byteKey, byteData, hashlib.sha512).hexdigest()

def payment(request):

    if request.method == 'POST':
        print(request.POST)
        # Process input data and build url payment
        form = OrderForm(request.POST)
        if form.is_valid():
            user = request.user
            amount = form.cleaned_data['tong_tien']
            email = form.cleaned_data['email']
            dia_chi = form.cleaned_data['address']
            cart_items = CartItem.objects.filter(user=user)

            # Thực hiện giao dịch (Transaction) để đảm bảo tính toàn vẹn dữ liệu
            hoa_don = HoaDon.objects.create(
                user=user,
                tongTien=amount,
                email=email,
                diaChi=dia_chi
            )

            # Lưu chi tiết đơn hàng
            for item in cart_items:
                    Detail.objects.create(
                        user= user,
                        hoaDon=hoa_don,
                        product=item.product,
                        quantity=item.quantity
                    )

                # Xóa các sản phẩm trong giỏ hàng sau khi đặt hàng thành công
            cart_items.delete()

            lastBill = HoaDon.objects.order_by('maHoaDon').last()
            order_id = 1
            if lastBill:
                order_id += lastBill.maHoaDon 
            
            bank_code = ''
            ipaddr = get_client_ip(request)
            # Build URL Payment
            vnp = vnpay()
            vnp.requestData['vnp_Version'] = '2.1.0'
            vnp.requestData['vnp_Command'] = 'pay'
            vnp.requestData['vnp_TmnCode'] = settings.VNPAY_TMN_CODE
            vnp.requestData['vnp_Amount'] = amount * 100
            vnp.requestData['vnp_CurrCode'] = 'VND'
            vnp.requestData['vnp_TxnRef'] = order_id
            vnp.requestData['vnp_OrderInfo'] = "thanh toán hóa đơn "
            vnp.requestData['vnp_OrderType'] = "topup"
            vnp.requestData['vnp_Locale'] = 'vn'
                # Check bank_code, if bank_code is empty, customer will be selected bank on VNPAY
            if bank_code and bank_code != "":
                vnp.requestData['vnp_BankCode'] = bank_code
                

            vnp.requestData['vnp_CreateDate'] = datetime.now().strftime('%Y%m%d%H%M%S')  # 20150410063022
            vnp.requestData['vnp_IpAddr'] = ipaddr
            vnp.requestData['vnp_ReturnUrl'] = settings.VNPAY_RETURN_URL
            vnpay_payment_url = vnp.get_payment_url(settings.VNPAY_PAYMENT_URL, settings.VNPAY_HASH_SECRET_KEY)
            print(vnpay_payment_url)
            return redirect(vnpay_payment_url)
        else:
            print("Form input not validate")
    else:
        return render(request, "payment.html", {"title": "Thanh toán"})

def payment_ipn(request):
    inputData = request.GET
    if inputData:
        vnp = vnpay()
        vnp.responseData = inputData.dict()
        order_id = inputData['vnp_TxnRef']
        amount = inputData['vnp_Amount']
        order_desc = inputData['vnp_OrderInfo']
        vnp_TransactionNo = inputData['vnp_TransactionNo']
        vnp_ResponseCode = inputData['vnp_ResponseCode']
        vnp_TmnCode = inputData['vnp_TmnCode']
        vnp_PayDate = inputData['vnp_PayDate']
        vnp_BankCode = inputData['vnp_BankCode']
        vnp_CardType = inputData['vnp_CardType']
        if vnp.validate_response(settings.VNPAY_HASH_SECRET_KEY):
            # Check & Update Order Status in your Database
            # Your code here
            firstTimeUpdate = True
            totalamount = True
            if totalamount:
                if firstTimeUpdate:
                    if vnp_ResponseCode == '00':
                        print('Payment Success. Your code implement here')
                    else:
                        print('Payment Error. Your code implement here')

                    # Return VNPAY: Merchant update success
                    result = JsonResponse({'RspCode': '00', 'Message': 'Confirm Success'})
                else:
                    # Already Update
                    result = JsonResponse({'RspCode': '02', 'Message': 'Order Already Update'})
            else:
                # invalid amount
                result = JsonResponse({'RspCode': '04', 'Message': 'invalid amount'})
        else:
            # Invalid Signature
            result = JsonResponse({'RspCode': '97', 'Message': 'Invalid Signature'})
    else:
        result = JsonResponse({'RspCode': '99', 'Message': 'Invalid request'})

    return result


def payment_return(request):
    inputData = request.GET
    if inputData:
        vnp = vnpay()
        vnp.responseData = inputData.dict()
        order_id = inputData['vnp_TxnRef']
        amount = int(inputData['vnp_Amount']) / 100
        order_desc = inputData['vnp_OrderInfo']
        vnp_TransactionNo = inputData['vnp_TransactionNo']
        vnp_ResponseCode = inputData['vnp_ResponseCode']
        vnp_TmnCode = inputData['vnp_TmnCode']
        vnp_PayDate = inputData['vnp_PayDate']
        vnp_BankCode = inputData['vnp_BankCode']
        vnp_CardType = inputData['vnp_CardType']
        if vnp.validate_response(settings.VNPAY_HASH_SECRET_KEY):
            if vnp_ResponseCode == "00":
                return render(request, "payment_return.html", {"title": "Kết quả thanh toán",
                                                               "result": "Thành công", "order_id": order_id,
                                                               "amount": amount,
                                                               "order_desc": order_desc,
                                                               "vnp_TransactionNo": vnp_TransactionNo,
                                                               "vnp_ResponseCode": vnp_ResponseCode})
            else:
                return render(request, "payment_return.html", {"title": "Kết quả thanh toán",
                                                               "result": "Lỗi", "order_id": order_id,
                                                               "amount": amount,
                                                               "order_desc": order_desc,
                                                               "vnp_TransactionNo": vnp_TransactionNo,
                                                               "vnp_ResponseCode": vnp_ResponseCode})
        else:
            return render(request, "payment_return.html",
                          {"title": "Kết quả thanh toán", "result": "Lỗi", "order_id": order_id, "amount": amount,
                           "order_desc": order_desc, "vnp_TransactionNo": vnp_TransactionNo,
                           "vnp_ResponseCode": vnp_ResponseCode, "msg": "Sai checksum"})
    else:
        return render(request, "vnpay/payment_return.html", {"title": "Kết quả thanh toán", "result": ""})


def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip

n = random.randint(10**11, 10**12 - 1)
n_str = str(n)
while len(n_str) < 12:
    n_str = '0' + n_str


def query(request):
    if request.method == 'GET':
        return render(request, "query.html", {"title": "Kiểm tra kết quả giao dịch"})

    url = settings.VNPAY_API_URL
    secret_key = settings.VNPAY_HASH_SECRET_KEY
    vnp_TmnCode = settings.VNPAY_TMN_CODE
    vnp_Version = '2.1.0'

    vnp_RequestId = n_str
    vnp_Command = 'querydr'
    vnp_TxnRef = request.POST['order_id']
    vnp_OrderInfo = 'kiem tra gd'
    vnp_TransactionDate = request.POST['trans_date']
    vnp_CreateDate = datetime.now().strftime('%Y%m%d%H%M%S')
    vnp_IpAddr = get_client_ip(request)

    hash_data = "|".join([
        vnp_RequestId, vnp_Version, vnp_Command, vnp_TmnCode,
        vnp_TxnRef, vnp_TransactionDate, vnp_CreateDate,
        vnp_IpAddr, vnp_OrderInfo
    ])

    secure_hash = hmac.new(secret_key.encode(), hash_data.encode(), hashlib.sha512).hexdigest()

    data = {
        "vnp_RequestId": vnp_RequestId,
        "vnp_TmnCode": vnp_TmnCode,
        "vnp_Command": vnp_Command,
        "vnp_TxnRef": vnp_TxnRef,
        "vnp_OrderInfo": vnp_OrderInfo,
        "vnp_TransactionDate": vnp_TransactionDate,
        "vnp_CreateDate": vnp_CreateDate,
        "vnp_IpAddr": vnp_IpAddr,
        "vnp_Version": vnp_Version,
        "vnp_SecureHash": secure_hash
    }

    headers = {"Content-Type": "application/json"}

    response = requests.post(url, headers=headers, data=json.dumps(data))

    if response.status_code == 200:
        response_json = json.loads(response.text)
    else:
        response_json = {"error": f"Request failed with status code: {response.status_code}"}

    return render(request, "query.html", {"title": "Kiểm tra kết quả giao dịch", "response_json": response_json})

def refund(request):
    if request.method == 'GET':
        return render(request, "refund.html", {"title": "Hoàn tiền giao dịch"})

    url = settings.VNPAY_API_URL
    secret_key = settings.VNPAY_HASH_SECRET_KEY
    vnp_TmnCode = settings.VNPAY_TMN_CODE
    vnp_RequestId = n_str
    vnp_Version = '2.1.0'
    vnp_Command = 'refund'
    vnp_TransactionType = request.POST['TransactionType']
    vnp_TxnRef = request.POST['order_id']
    vnp_Amount = request.POST['amount']
    vnp_OrderInfo = request.POST['order_desc']
    vnp_TransactionNo = '0'
    vnp_TransactionDate = request.POST['trans_date']
    vnp_CreateDate = datetime.now().strftime('%Y%m%d%H%M%S')
    vnp_CreateBy = 'user01'
    vnp_IpAddr = get_client_ip(request)

    hash_data = "|".join([
        vnp_RequestId, vnp_Version, vnp_Command, vnp_TmnCode, vnp_TransactionType, vnp_TxnRef,
        vnp_Amount, vnp_TransactionNo, vnp_TransactionDate, vnp_CreateBy, vnp_CreateDate,
        vnp_IpAddr, vnp_OrderInfo
    ])

    secure_hash = hmac.new(secret_key.encode(), hash_data.encode(), hashlib.sha512).hexdigest()

    data = {
        "vnp_RequestId": vnp_RequestId,
        "vnp_TmnCode": vnp_TmnCode,
        "vnp_Command": vnp_Command,
        "vnp_TxnRef": vnp_TxnRef,
        "vnp_Amount": vnp_Amount,
        "vnp_OrderInfo": vnp_OrderInfo,
        "vnp_TransactionDate": vnp_TransactionDate,
        "vnp_CreateDate": vnp_CreateDate,
        "vnp_IpAddr": vnp_IpAddr,
        "vnp_TransactionType": vnp_TransactionType,
        "vnp_TransactionNo": vnp_TransactionNo,
        "vnp_CreateBy": vnp_CreateBy,
        "vnp_Version": vnp_Version,
        "vnp_SecureHash": secure_hash
    }

    headers = {"Content-Type": "application/json"}

    response = requests.post(url, headers=headers, data=json.dumps(data))

    if response.status_code == 200:
        response_json = json.loads(response.text)
    else:
        response_json = {"error": f"Request failed with status code: {response.status_code}"}

    return render(request, "refund.html", {"title": "Kết quả hoàn tiền giao dịch", "response_json": response_json})

# def activate(request, uidb64, token):  
#     User = get_user_model()  
#     try:  
#         uid = force_str(urlsafe_base64_decode(uidb64))  
#         user = User.objects.get(pk=uid)  
#     except(TypeError, ValueError, OverflowError, User.DoesNotExist):  
#         user = None  
#     if user is not None and account_activation_token.check_token(user, token):  
#         user.is_active = True  
#         user.save()  
#         return HttpResponse('Thank you for your email confirmation. Now you can login your account.')  
#     else:  
#         return HttpResponse('Activation link is invalid!') 

#REGISTER FUNCTION
# def Register_user(request):
#     form=SignUpForm()
#     if request.method=='POST':
#       form=SignUpForm(request.POST)
      
#       if form.is_valid():
#         user = form.save(commit=False)
#         user.is_active = False
#         user.save()
        
#         current_site = get_current_site(request)  
#         mail_subject = 'Activation link has been sent to your email id'   
#         message = render_to_string('acc_active_email.html', {  
#                 'user': user,  
#                 'domain': current_site.domain,  
#                 'uid':urlsafe_base64_encode(force_bytes(user.pk)),  
#                 'token':account_activation_token.make_token(user),  
#             })  
#         to_email = form.cleaned_data.get('email')  
#         email = EmailMessage(  
#                         mail_subject, message, to=[to_email]  
#             )  
#         email.send()  
#         messages.success(request,"Please confirm your email address to complete the registration") 
#         return redirect('home')
       
#       else:  
          
#           form = SignUpForm()  
#           return render(request, 'register.html', {'form': form})
#     return render(request, 'register.html')
#Từ homePage lấy đối tượng product_id sau đó hàm sẽ lấy và gán vào pro_id, sau đó sẽ gửi đến urls.py