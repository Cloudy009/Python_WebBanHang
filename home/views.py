import json
from django.contrib.auth.models import User
from django.utils import timezone
from .models import *
from django.shortcuts import render, get_object_or_404, redirect
from django.db.models import Sum
from django.contrib import messages
from .calculations import *

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
            messages.success(request, f'Cảm ơn bạn {name} đã gửi email cho shop')

            # # Chuyển hướng hoặc hiển thị thông báo thành công
            return redirect('homePage')  # Thay 'success_page' bằng tên trang thành công của bạn

    else:
        messages.error(request, "Không tìm thấy Email hợp lệ")
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
        return False
    
# THÊM SẢN PHẨM VÀO GIỎ HÀNG TẠM THỜI CỦA USER
@login_required
def add_to_cart(request):
    try:
        product_id = request.POST.get("product_id")
        
        product = get_object_or_404(Product, pro_id=product_id)
        product_id = product.pro_id
        print(product_id)
        user = request.user

        # Thêm sản phẩm vào giỏ hàng hoặc tăng số lượng nếu đã tồn tại
        cart_item, created = CartItem.objects.get_or_create(user=user, product=product)
        if not created:
            cart_item.quantity += 1
            cart_item.save()
            messages.success(request,'Đã thêm sản phẩm {cart_item} vào giỏ hàng')

        # return JsonResponse({"status": "success", "message": "Product added to cart successfully"})
        return redirect(product_detail, product_id)
    except Exception as e:
        print(e)
        return redirect('foodPage')
       

@login_required
def add_cart(request):
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
            messages.success(request,'Đã thêm sản phẩm {cart_item} vào giỏ hàng')
        return redirect('foodPage')
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

@login_required
@require_POST
def remove_item(request):
    try:
        data = json.loads(request.body)
        product_id = data.get("product_id")
        product = get_object_or_404(Product, pro_id=product_id)
        user = request.user

        # Tìm CartItem chứa Product cần xóa
        cart_item = CartItem.objects.filter(user=user, product=product).first()
        if cart_item:
            cart_item.delete()
            # Thêm thông báo đã xóa sản phẩm thành công vào messages
            success_message = "Xóa sản phẩm thành công"
            messages.success(request, success_message)
            return JsonResponse({"status": "success", "message": "Xóa sản phẩm thành công"})
        else:
            return JsonResponse({"status": "error", "message": "Sản phẩm không tồn tại trong giỏ hàng"})
    except Exception as e:
        print(e)
        return JsonResponse({"status": "error", "message": "Đã xảy ra lỗi khi xóa sản phẩm"})
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
        'messages': messages.get_messages(request)
    }
    
    
    # return render(request, 'shop/cart_Page.html',{'context' :context, 'messages': messages.get_messages(request)})
    
    return render(request, 'shop/cart_Page.html',context)

@login_required
def checkOut(request):
    user = request.user
    cart_items = CartItem.objects.filter(user=user)
    total_items = cart_items.count()
    if total_items != 0:
        total_amount = sum(item.product.price * item.quantity for item in cart_items)
        
        for item in cart_items:
            item.total_price = item.product.price * item.quantity

        context = {
            'cart_items': cart_items,
            'total_items': total_items,
            'total_amount': total_amount,
        }
        return render(request, 'shop/thanhToan_Page.html',context)
    else:
        error_message = "Giỏ hàng của bạn đang trống "
        messages.error(request, error_message)
        return redirect('cart_Page')
        


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

        messages.success(request, 'Đơn hàng của bạn đã được đặt thành công! Cảm ơn bạn.')

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
         'reviews' : reviews,
         'messages': messages.get_messages(request)
    }

    return render( request, 'shop/productDetail.html',
                context)


def homePage(request):
    newProduct = Product.objects.order_by('-created_at')[:3]
    total_items = 0
   
    # Kiểm tra xem thông báo đã được hiển thị trước đó hay chưa
    first = False
    if not request.session.get('welcome_message_displayed', False):
        first = True
        # Đặt biến session để chỉ ra rằng thông báo đã được hiển thị
        request.session['welcome_message_displayed'] = True
        
    # Kiểm tra xem người dùng đã đăng nhập chưa
    if request.user.is_authenticated:
        cart_items = CartItem.objects.filter(user=request.user)
        total_items = cart_items.count()

    context = {
        'newProduct': newProduct,
        'allProduct': allProduct,
        'total_items': total_items,
        'categories': categories,
        'messages': messages.get_messages(request),
        'first' : first
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
        'messages': messages.get_messages(request),
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
    messages.success(request, "This is your admin page!")

    context = {
        'details': details_without_reviews,
        'messages': messages.get_messages(request),
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

        return redirect('inforCustomer')
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
