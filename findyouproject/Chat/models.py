from django.db import models
from .choices import Chattype , SeenStatus, ObjectStatusChoices

class BaseFindModel(models.Model):
    added_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    updated_by = models.CharField(blank=True,null=True,max_length=100)
    object_status = models.SmallIntegerField(choices=ObjectStatusChoices.CHOICES,default=0)

    class Meta:
        abstract = True

class Chat(BaseFindModel):
    title=models.CharField(max_length = 200, blank=True, null=True)
    contentid = models.BigIntegerField(blank=True, null=True,help_text="id of content if exists" )
    profile_pic = models.ImageField(upload_to='chatprofile/media/', help_text="picture of content if exists")
    chattype = models.IntegerField(choices=Chattype.CHOICES)
    user = models.TextField(help_text="list of users")
    is_active = models.BooleanField(default=True)

class ChatContent(BaseFindModel):
    chat = models.BigIntegerField(help_text = "refrence of chat")
    text = models.TextField(blank=True,null=True)
    media = models.FileField(upload_to="chatmedia/media",blank=True,null=True)
    seenstatus = models.IntegerField(choices =SeenStatus.CHOICES , default = 3)
    is_active = models.BooleanField(default=True)