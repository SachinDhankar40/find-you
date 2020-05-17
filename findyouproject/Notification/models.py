from django.db import models

class BaseFindModel(models.Model):
    added_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    updated_by = models.CharField(blank=True,null=True,max_length=100)

    class Meta:
        abstract = True

class NotificationUser(models.Model):
    userId = models.BigIntegerField()
    profile_picture = models.TextField(help_text="path of profile picture",null=True, blank=True)
    name = models.CharField(max_length=255, null=True, blank=True)

class NotificationContent(models.Model):
    contentId = models.BigIntegerField()
    contentthumbnail = models.TextField(help_text = "path of content media thumbnail",null=True, blank=True)

class ContentNotification(BaseFindModel):
    content = models.ForeignKey(NotificationContent, on_delete=models.CASCADE)
    description = models.CharField(max_length=150)
    contentstatement = models.TextField()

class ChatNotification(BaseFindModel):
    chat = models.BigIntegerField()
    description = models.CharField(max_length=150)
    contentstatement = models.TextField()

class UserNotification(BaseFindModel):
    user = models.ForeignKey(NotificationUser,on_delete=models.CASCADE)
    description = models.CharField(max_length=150)