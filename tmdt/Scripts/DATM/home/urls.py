from django.urls import path , re_path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('add_to_cart', views.add_to_cart, name='add_to_cart'),
    path('delete-items', views.transaction, name='delete_items'),
    path('profile/', views.infor_profile, name='profile'),
    path('update-cart/', views.update_cart, name= 'update_cart'),
    path('shop/', views.homePage, name= 'homePage'),
    path('send_email/', views.send_email, name= 'send_email'),
    path('shop/cart/', views.view_cart, name= 'cart_Page'),
    path('shop/test/', views.testFiller, name= 'test'),
    path('shop/cart/checkOut', views.checkOut, name= 'checkOut'),
    path('infor/', views.inforCustomer, name= 'inforCustomer'),
    path('product_review/<int:product_id>/<int:hoadon_id>/', views.product_review, name='product_review'),
    path('add_review/<int:product_id>/<int:hoadon_id>/<int:detail_id>/', views.add_review, name='add_review'),
	path('infor/capNhat/', views.change_password, name= 'capNhat'),
	path('logOut/', views.logOut, name= 'logOut'), 
    path('shop/cart/checkOut/thanhToan', views.Dat_hang, name= 'dat_hang'),
    path('shop/food/', views.foodPage, name= 'foodPage'),
    path('shop/about/', views.aboutPage, name= 'aboutPage'),
    path('shop/contact/', views.contactPage, name= 'contactPage'),
    path('shop/<int:product_id>/', views.product_detail, name='product-detail'),
    path('shop/<str:category_name>/', views.product_list_by_category, name='product_list'),
    path('payment/', views.payment, name='payment'),
    re_path(r'^payment_ipn$', views.payment_ipn, name='payment_ipn'),
    re_path(r'^payment_return$', views.payment_return, name='payment_return'),
    re_path(r'^query$', views.query, name='query'),
    re_path(r'^refund$', views.refund, name='refund'),
]


