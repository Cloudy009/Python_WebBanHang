from django.db import models
from django.contrib.auth.models import User
# Create your models here.
class Category(models.Model):
    cate_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    image_cat = models.CharField(max_length=200)
    detail = models.TextField(null=True, blank=True)
    def __str__(self):
        return self.name
    
class Product(models.Model):
    pro_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=200)
    price = models.IntegerField()
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    image_pro = models.CharField(max_length=200)

    def __str__(self):
        return self.title
    class Meta:
        db_table = 'home_product'


class CartItem(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)
    
    def __str__(self):
        return f"{self.user.username} - {self.product.title}"
    class Meta:
        db_table = 'home_cartitem'
    
class HoaDon(models.Model):
    maHoaDon = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    tongTien = models.IntegerField()
    email = models.EmailField(max_length=50)
    diaChi = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    status = models.BooleanField(default=False)
    loi = models.CharField(max_length= 100)

    def __str__(self):
        return f" {self.maHoaDon} - {self.user.username}"
    class Meta:
        db_table = 'home_hoaDon'

class Detail(models.Model):
    hoaDon = models.ForeignKey(HoaDon, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)

    def __str__(self):
        return f"{self.hoaDon} - {self.product.title}"
    class Meta:
        db_table = 'home_detail'

class Feedback(models.Model):
    mess_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    email = models.EmailField(max_length=50)
    phone_number = models.IntegerField()
    message = models.TextField()
    time = models.DateTimeField(auto_now_add = True)
    def __str__(self):
        return f"{self.user.username} - {self.user.email}"
    
    class Meta:
        db_table: 'home_feedback'

class Review(models.Model):
    hoadon = models.ForeignKey(HoaDon, on_delete = models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    detail = models.ForeignKey(Detail, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)  # Thêm liên kết với Product
    rate = models.IntegerField()
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add = True)

    def __str__(self):
        return f"{self.user.username} - {self.product.title} - {self.created_at}"

    class Meta:
        db_table: 'home_review'