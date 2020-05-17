from django.contrib import admin
from .models import ContentNotification, ChatNotification, UserNotification

admin.site.register(ContentNotification)
admin.site.register(ChatNotification)
admin.site.register(UserNotification)