from django.db import models
from .choices import ObjectStatusChoices

class BaseFindModel(models.Model):
    added_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    updated_by = models.CharField(blank=True,null=True,max_length=100)
    object_status = models.SmallIntegerField(choices=ObjectStatusChoices.CHOICES,default=0)

    class Meta:
        abstract = True

class NotificationContent(models.Model):
    contentId = models.BigIntegerField()
    contentthumbnail = models.TextField(help_text = "path of content media thumbnail",null=True, blank=True)
    object_status = models.SmallIntegerField(choices=ObjectStatusChoices.CHOICES,default=0)

class ContentNotification(BaseFindModel):
    content = models.ForeignKey(NotificationContent, on_delete=models.CASCADE)
    description = models.CharField(max_length=150)
    contentstatement = models.TextField()

class ChatNotification(BaseFindModel):
    chat = models.BigIntegerField()
    description = models.CharField(max_length=150)
    contentstatement = models.TextField()

class UserNotification(BaseFindModel):
    user = models.BigIntegerField()
    description = models.CharField(max_length=150)