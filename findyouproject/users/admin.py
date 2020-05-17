from django.contrib import admin
from .models import User, CscDetails, FindyouUser, InvalidLogin, Division, ContentMonitorAdmin, UserOTP

admin.site.register(User)
admin.site.register(CscDetails)
admin.site.register(FindyouUser)
admin.site.register(InvalidLogin)
admin.site.register(Division)
admin.site.register(ContentMonitorAdmin)
admin.site.register(UserOTP)