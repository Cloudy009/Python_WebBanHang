from datetime import datetime
import locale
from django.contrib.auth.models import User
from django.utils import timezone
from .models import *
from django.db.models import Sum, Count, F

def calculate_monthly_revenue():
    locale.setlocale(locale.LC_ALL, '')
    now = datetime.now()
    revenue_monthly = Detail.objects.filter(hoaDon__created_at__year=now.year, hoaDon__created_at__month=now.month).aggregate(
        total_revenue=Sum(F('product__price') * F('quantity'))
    )['total_revenue'] or 0
    
    revenue_monthly = locale.format_string("%d", revenue_monthly, grouping=True)
    return revenue_monthly

def calculate_day_revenue():
    locale.setlocale(locale.LC_ALL, '')
    # Lấy thời điểm hiện tại
    now = datetime.now()
    # Lấy các chi tiết hóa đơn được tạo ra trong ngày hiện tại
    details_today = Detail.objects.filter(hoaDon__created_at__date=now.date())
    # Tính tổng doanh thu
    total_revenue = details_today.aggregate(
        total_revenue=Sum(F('product__price') * F('quantity'))
    )['total_revenue'] or 0

    total_revenue = locale.format_string("%d", total_revenue, grouping=True)
    
    return total_revenue

def calculate_daily_products_sold():
    now = datetime.now()
    products_sold_daily = Detail.objects.filter(hoaDon__created_at__date=now.date()).aggregate(
        total_products_sold=Count('product', distinct=True)
    )['total_products_sold'] or 0
    return products_sold_daily

def calculate_monthly_products_sold():
    now = datetime.now()
    products_sold_monthly = Detail.objects.filter(hoaDon__created_at__year=now.year, hoaDon__created_at__month=now.month).aggregate(
        total_products_sold=Count('product', distinct=True)
    )['total_products_sold'] or 0
    return products_sold_monthly

def count_registered_users_today():
    try:
        today = timezone.now().date()
        count_customer = User.objects.filter(date_joined__date=today, is_staff=False).count()
        
        return count_customer
    except Exception as e:
        print(f"Error counting registered users: {e}")
        return 0

def count_registered_staffs_today():
    try:
        today = timezone.now().date()
        count_staff = User.objects.filter(date_joined__date=today, is_staff=True).count()
        
        return count_staff
    except Exception as e:
        print(f"Error counting registered staffs: {e}")
        return 0