from django.contrib import admin
from import_export.admin import ImportExportModelAdmin

from .models import Cart, Category, MenuItem, Order, OrderItem


@admin.register(MenuItem)
class MenuItemAdmin(ImportExportModelAdmin):
    pass


@admin.register(Category)
class CategoryAdmin(ImportExportModelAdmin):
    pass


@admin.register(Cart)
class CartAdmin(ImportExportModelAdmin):
    pass


@admin.register(Order)
class OrderAdmin(ImportExportModelAdmin):
    pass


@admin.register(OrderItem)
class OrderItemAdmin(ImportExportModelAdmin):
    pass
