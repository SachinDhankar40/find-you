from django.db import models
from django.contrib.auth.models import AbstractUser
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from rest_framework.authtoken.models import Token
from django.conf import settings
from .choices import CscType
from django.utils.translation import ugettext_lazy as _
from django.contrib.auth.models import Group, Permission
from django.core.exceptions import PermissionDenied
from django.contrib import auth

class PermissionsMixin(models.Model):
    """
    A mixin class that adds the fields and methods necessary to support
    Django's Group and Permission model using the ModelBackend.
    """
    is_superuser = models.BooleanField(
        _('superuser status'),
        default=False,
        help_text=_(
            'Designates that this user has all permissions without'
            'explicitly assigning them.'
        ),
    )
    groups = models.ManyToManyField(
        Group,
        verbose_name=_('groups'),
        blank=True,
        help_text=_(
            'The groups this user belongs to. A user will get all permissions '
            'granted to each of their groups.'
        ),
        related_name="user_groups_set",
        related_query_name="resonance_user",
    )
    user_permissions = models.ManyToManyField(
        Permission,
        verbose_name=_('user permissions'),
        blank=True,
        help_text=_('Specific permissions for this user.'),
        related_name="user_permissions_set",
        related_query_name="resonance_user",
    )

    class Meta:
        abstract = True

    def get_group_permissions(self, obj=None):
        """
        Returns a list of permission strings that this user has through their
        groups. This method queries all available auth backends. If an object
        is passed in, only permissions matching this object are returned.
        """
        permissions = set()
        for backend in auth.get_backends():
            if hasattr(backend, "get_group_permissions"):
                permissions.update(backend.get_group_permissions(self, obj))
        return permissions

    def get_all_permissions(self, obj=None):
        return _user_get_all_permissions(self, obj)

    def has_perm(self, perm, obj=None):
        """
        Returns True if the user has the specified permission. This method
        queries all available auth backends, but returns immediately if any
        backend returns True. Thus, a user who has permission from a single
        auth backend is assumed to have permission in general. If an object is
        provided, permissions for this specific object are checked.
        """

        # Active superusers have all permissions.
        if self.is_active and self.is_superuser:
            return True

        # Otherwise we need to check the backends.
        return _user_has_perm(self, perm, obj)

    def has_perms(self, perm_list, obj=None):
        """
        Returns True if the user has each of the specified permissions. If
        object is passed, it checks if the user has all required perms for this
        object.
        """
        for perm in perm_list:
            if not self.has_perm(perm, obj):
                return False
        return True

    def has_module_perms(self, app_label):
        """
        Returns True if the user has any permissions in the given app label.
        Uses pretty much the same logic as has_perm, above.
        """
        # Active superusers have all permissions.
        if self.is_active and self.is_superuser:
            return True

        return _user_has_module_perms(self, app_label)


def _user_get_all_permissions(user, obj):
    permissions = set()
    for backend in auth.get_backends():
        if hasattr(backend, "get_all_permissions"):
            permissions.update(backend.get_all_permissions(user, obj))
    return permissions


def _user_has_perm(user, perm, obj):
    """
    A backend can raise `PermissionDenied` to short-circuit permission checking.
    """
    for backend in auth.get_backends():
        if not hasattr(backend, 'has_perm'):
            continue
        try:
            if backend.has_perm(user, perm, obj):
                return True
        except PermissionDenied:
            return False
    return False


def _user_has_module_perms(user, app_label):
    """
    A backend can raise `PermissionDenied` to short-circuit permission checking.
    """
    for backend in auth.get_backends():
        if not hasattr(backend, 'has_module_perms'):
            continue
        try:
            if backend.has_module_perms(user, app_label):
                return True
        except PermissionDenied:
            return False
    return False


def filter_user_queryset_by_hierarchy(user, queryset, filter_on='assign_to_user__in'):
    if user.is_superuser:
        return queryset
    else:
        all_childrens = user.get_all_child
        return queryset.filter(**{filter_on: all_childrens})

class BaseFindModel(models.Model):
    added_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    updated_by = models.CharField(blank=True,null=True,max_length=100)

    class Meta:
        abstract = True


class CscDetails(BaseFindModel):
    label = models.CharField(max_length=50, blank=True, null=True)
    parent = models.ForeignKey('self',blank=True,null=True,on_delete=models.SET_NULL)
    csc_type = models.IntegerField(choices=CscType.CHOICES, blank=True, null=True)

    def __str__(self):
        return self.label+" "+str(self.id)

class Division(BaseFindModel):
    label = models.CharField(max_length=150)
    csc = models.ForeignKey(CscDetails,blank=True,null=True,on_delete=models.SET_NULL)

class UserManager(BaseUserManager):
    def create_user(self, username, email, mobile, password=None):
        if not email:
            raise ValueError('Users must have an email address')

        user = self.model(username=username, mobile=mobile, email=self.normalize_email(email))
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, username, email, mobile, password):
        user = self.create_user(
            username=username, email=email, password=password, mobile=mobile)
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)
        return user



class User(AbstractBaseUser,PermissionsMixin):
    USER_TYPE_CHOICES = (
        (1, "Admin"),
        (2, "findyouuser"),
    )
    gender_choice = (
        (1, 'Male'),
        (2, 'Female')
    )

    username = models.CharField(max_length=60, unique=True)
    firstName = models.CharField(max_length=255, null=True, blank=True)
    lastName = models.CharField(max_length=255, null=True, blank=True)
    email = models.EmailField(max_length=255, null=True, blank=True)
    mobile = models.BigIntegerField(null=True, blank=True)
    profile_picture = models.ImageField(upload_to='users/profile/')
    gender = models.PositiveSmallIntegerField(choices=gender_choice, null=True, blank=True)
    role = models.PositiveSmallIntegerField(choices=USER_TYPE_CHOICES, default=2)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    USERNAME_FIELD = 'username'

    objects = UserManager()

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        Token.objects.get_or_create(user=self)

    def __str__(self):
        return self.username

class FindyouUser(BaseFindModel):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    coverpic = models.ImageField(upload_to='users/profile/')
    Description = models.TextField(null=True, blank=True)
    primecreater = models.BooleanField(default=False)
    Interest = models.TextField(null=True, blank=True)
    country = models.ForeignKey(CscDetails,related_name='country',on_delete=models.SET_NULL,null=True)
    state = models.ForeignKey(CscDetails,related_name='state',on_delete=models.SET_NULL,null=True)
    city = models.ForeignKey(CscDetails,related_name='city',on_delete=models.SET_NULL,null=True)
    BlockList= models.TextField(null=True, blank=True , help_text="show the list of blocked users ids")
    contentViewpercent = models.FloatField(null=True,blank=True, help_text="show the other content view percentage of user")
    post = models.BigIntegerField(null=True, blank=True, help_text="number od post done by user")
    subscriber = models.BigIntegerField(null=True, blank=True, help_text="number of subscriber of user")
    subscriberUser= models.TextField(null=True, blank=True, help_text="show the list of subscriber users ids")
    subscribing = models.BigIntegerField(null=True, blank=True, help_text="number of subscribing by user")
    subscribingUser= models.TextField(null=True, blank=True, help_text="show the list of subscribing users ids")
    saved_content = models.TextField(null=True, blank=True, help_text="show the list of saved contents ids")

    def __str__(self):
        return f'{self.user.firstName} {self.user.lastName}'

    def location(self):
        return f'{self.country.label}, {self.state.label}, {self.city.label}'
    
    @property
    def fullname(self):
        return f'{self.user.firstName}{self.user.lastName}'

class ContentMonitorAdmin(BaseFindModel):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    content_type = models.IntegerField()
    region = models.ForeignKey(Division,on_delete=models.SET_NULL,null=True)
    
    def __str__(self):
        return f'{self.user.firstName} {self.user.lastName}'

class AdvertisePartner(BaseFindModel):
    name = models.CharField(max_length=200)
    email = models.EmailField(max_length=255)
    mobile = models.BigIntegerField()
    companyname=models.CharField(max_length=200, blank=True, null=True)

    def __str__(self):
        return self.name

class UserOTP(BaseFindModel):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='otps')
    otp = models.CharField(max_length=6)

    def __str__(self):
        return "{} : {}".format(self.user.username, self.otp)

class InvalidLogin(BaseFindModel):
    name = models.CharField(max_length=255, null=True, blank=True)
    message = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.name