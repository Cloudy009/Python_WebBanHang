from django.contrib import admin
from .models import *

class ProductAdmin(admin.ModelAdmin):
    list_display = ['pro_id', 'title', 'price', 'category', 'created_at', 'updated_at', 'image_pro']
    search_fields = ['title__icontains', 'price']


class CategoryAdmin(admin.ModelAdmin):
    list_display = ['cate_id', 'name','created_at','updated_at', 'detail']
    search_fields = ['name']
# Đăng ký Category và Product với admin site
admin.site.register(Category, CategoryAdmin)
admin.site.register(Product, ProductAdmin)

admin.site.register(CartItem)
admin.site.register(HoaDon)
admin.site.register(Detail)
admin.site.register(Feedback)
