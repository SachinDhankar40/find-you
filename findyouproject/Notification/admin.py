from django.contrib import admin
from .models import ContentNotification, ChatNotification, UserNotification, NotificationUser, NotificationContent

admin.site.register(ContentNotification)
admin.site.register(NotificationUser)
admin.site.register(NotificationContent)
admin.site.register(ChatNotification)
admin.site.register(UserNotification)