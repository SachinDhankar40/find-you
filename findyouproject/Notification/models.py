from django.db import models

class BaseFindModel(models.Model):
    added_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    updated_by = models.CharField(blank=True,null=True,max_length=100)

    class Meta:
        abstract = True

class ContentNotification(BaseFindModel):
    content = models.BigIntegerField()
    description = models.CharField(max_length=150)
    contentstatement = models.TextField()

class ChatNotification(BaseFindModel):
    chat = models.BigIntegerField()
    description = models.CharField(max_length=150)
    contentstatement = models.TextField()

class UserNotification(BaseFindModel):
    chat = models.BigIntegerField()
    description = models.CharField(max_length=150)