from django.contrib import admin
from .models import Content, Comment, CommentReply, Like, View, Advertisement, SpamReport, ContentUser, ContentCategoryMapping,AdvertisementCategoryMapping

admin.site.register(Content)
admin.site.register(ContentUser)
admin.site.register(Comment)
admin.site.register(CommentReply)
admin.site.register(Like)
admin.site.register(View)
admin.site.register(Advertisement)
admin.site.register(SpamReport)
admin.site.register(ContentCategoryMapping)
admin.site.register(AdvertisementCategoryMapping)