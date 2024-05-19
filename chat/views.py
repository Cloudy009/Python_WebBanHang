from django.shortcuts import render, redirect
from chat.models import Room, Message
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.decorators import login_required



from django.shortcuts import render
from django.contrib.auth import authenticate, login

def custom_login(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            # Redirect to a success page.
            return redirect('home')
        else:
            # Return an 'invalid login' error message.
            return render(request, 'login.html', {'error_message': 'Invalid username or password.'})
    else:
        # Display the login form.
        return render(request, 'login.html')
    
    # Create your views here.
def home(request):
    # Lấy user từ request
    user = request.user

    # Kiểm tra xem user đã được xác thực và thuộc nhóm 'customer' hay không
    is_customer = user.is_authenticated and user.groups.filter(name='customer').exists()

    # Truyền biến is_customer vào context
    return render(request, 'home.html', {'is_customer': is_customer})

def room(request, room):
    username = request.GET.get('username')
    room_details = Room.objects.get(name=room)

    # Kiểm tra xem user có phải là admin hay không
    is_admin = request.user.groups.filter(name='admin').exists()

    # Nếu là admin, lấy danh sách các phòng chat để hiển thị trong select box
    rooms = Room.objects.all()

    return render(request, 'room.html', 
    {
        'username': username,
        'room': room,
        'room_details': room_details,
        'is_admin': is_admin,
        'rooms': rooms
    })


def checkview(request):
    room = request.POST['room_name']
    username = request.POST['username']

    if Room.objects.filter(name=room).exists():
        return redirect('/'+room+'/?username='+username)
    else:
        new_room = Room.objects.create(name=room)
        new_room.save()
        return redirect('/'+room+'/?username='+username)


def send(request):
    message = request.POST['message']
    username = request.POST['username']
    room_id = request.POST['room_id']

    new_message = Message.objects.create(value=message, user=username, room=room_id)
    new_message.save()
    return HttpResponse('Message sent successfully')

def getMessages(request, room):
    room_details = Room.objects.get(name=room)

    messages = Message.objects.filter(room=room_details.id)
    return JsonResponse({"messages":list(messages.values())})

def index(request):
    return render(request, 'index.html')

