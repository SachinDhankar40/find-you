from django.contrib import admin
from .models import ContentNotification, ChatNotification, UserNotification,NotificationContent

admin.site.register(ContentNotification)
admin.site.register(NotificationContent)
admin.site.register(ChatNotification)
admin.site.register(UserNotification)