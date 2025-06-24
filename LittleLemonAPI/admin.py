from django.contrib import admin
from django.contrib.auth.models import Group, User
from import_export import resources
from import_export.admin import ImportExportModelAdmin
from rest_framework.authtoken.models import Token

from .models import Cart, Category, MenuItem, Order, OrderItem

# --- Export support for built-in models ---
admin.site.unregister(User)
admin.site.unregister(Group)

class UserResource(resources.ModelResource):
    class Meta:
        model = User

class GroupResource(resources.ModelResource):
    class Meta:
        model = Group

class TokenResource(resources.ModelResource):
    class Meta:
        model = Token

@admin.register(User)
class CustomUserAdmin(ImportExportModelAdmin):
    resource_class = UserResource

@admin.register(Group)
class CustomGroupAdmin(ImportExportModelAdmin):
    resource_class = GroupResource

@admin.register(Token)
class TokenAdmin(ImportExportModelAdmin):
    resource_class = TokenResource


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
