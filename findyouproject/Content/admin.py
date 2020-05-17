from django.contrib import admin
from .models import Content, Comment, CommentReply, Like, View, Advertisement, SpamReport

admin.site.register(Content)
admin.site.register(Comment)
admin.site.register(CommentReply)
admin.site.register(Like)
admin.site.register(View)
admin.site.register(Advertisement)
admin.site.register(SpamReport)