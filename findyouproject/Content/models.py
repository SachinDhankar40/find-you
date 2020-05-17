from django.db import models
from .choices import CscType, ContentType, ContentCategory

class BaseFindModel(models.Model):
    added_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    updated_by = models.CharField(blank=True,null=True,max_length=100)

    class Meta:
        abstract = True


class CscDetails(BaseFindModel):
    label = models.CharField(max_length=50, blank=True, null=True)
    parent = models.ForeignKey('self',blank=True,null=True,on_delete=models.SET_NULL)
    csc_type = models.IntegerField(choices=CscType.CHOICES, blank=True, null=True)

    def __str__(self):
        return self.label+" "+str(self.id)

class ContentUser(models.Model):
    userId = models.BigIntegerField()
    profile_picture = models.TextField(help_text="path of profile picture")
    name = models.CharField(max_length=255, null=True, blank=True)
    country = models.BigIntegerField(help_text="id of country")
    state = models.BigIntegerField(help_text="id of state")
    city = models.BigIntegerField(help_text="id of city")

class Content(BaseFindModel):
    user = models.ForeignKey(ContentUser,on_delete=models.SET_NULL,null=True)
    description = models.TextField(blank=True, null=True)
    category = models.IntegerField(choices=ContentCategory.CHOICES)
    place = models.CharField(max_length=100, blank=True, null=True , help_text="content upload location reference")
    contenttype= models.IntegerField(choices = ContentType.CHOICES)
    associate_media = models.FileField(upload_to='textpost/media/', help_text="media file asscociated with text post")
    fontfamilly = models.CharField(max_length=150, blank=True, null=True, help_text="font family for text post")
    media = models.FileField(upload_to='content/media')
    medialist = models.TextField(blank=True, null=True, help_text="list of media file urls")
    chatInvited = models.BooleanField(default=False)
    commentinvited = models.BooleanField(default=True)
    notappropriate = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)

class Advertisement(BaseFindModel):
    user = models.BigIntegerField(help_text="reference of Advertise partner id")
    media = models.FileField(upload_to='adv/media')
    mediahref = models.TextField(help_text="after click url detail")
    is_active = models.BooleanField(default=True)

class SpamReport(BaseFindModel):
    content = models.ForeignKey(Content,on_delete=models.CASCADE)
    reported_by = models.BigIntegerField(help_text="reference of user id")
    decription = models.TextField()

class Like(BaseFindModel):
    content = models.ForeignKey(Content,on_delete=models.SET_NULL, blank=True, null=True)
    adv = models.ForeignKey(Advertisement,on_delete=models.SET_NULL, blank=True, null=True)
    liked_by = models.BigIntegerField(help_text="reference of user id")

class View(BaseFindModel):
    content = models.ForeignKey(Content,on_delete=models.SET_NULL, blank=True, null=True)
    adv = models.ForeignKey(Advertisement,on_delete=models.SET_NULL, blank=True, null=True)

class Comment(BaseFindModel):
    content = models.ForeignKey(Content,on_delete=models.SET_NULL, blank=True, null=True)
    adv = models.ForeignKey(Advertisement,on_delete=models.SET_NULL, blank=True, null=True)
    decription = models.TextField()
    comment_by = models.BigIntegerField(help_text = "reference of user")
    like = models.BigIntegerField(null=True, blank=True)
    is_active = models.BooleanField(default=True)

class CommentReply(BaseFindModel):
    comment = models.ForeignKey(Comment,on_delete=models.CASCADE)
    comment_by = models.BigIntegerField(help_text="reference of user id")
    decription = models.TextField()
    like = models.BigIntegerField(null=True, blank=True)
    is_active = models.BooleanField(default=True)