from django.db import models
from .choices import CscType, ContentType, ContentCategory,ObjectStatusChoices

class BaseFindModel(models.Model):
    added_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    updated_by = models.CharField(blank=True,null=True,max_length=100)
    object_status = models.SmallIntegerField(choices=ObjectStatusChoices.CHOICES,default=0)

    class Meta:
        abstract = True

class ContentUser(models.Model):
    userId = models.BigIntegerField()
    profile_picture = models.TextField(help_text="path of profile picture",null=True,blank=True)
    name = models.CharField(max_length=255, null=True, blank=True)
    Interest = models.TextField(null=True, blank=True)
    country = models.BigIntegerField(help_text="id of country",null=True,blank=True)
    state = models.BigIntegerField(help_text="id of country",null=True,blank=True)
    city = models.BigIntegerField(help_text="id of country",null=True,blank=True)
    BlockList= models.TextField(null=True, blank=True , help_text="show the list of blocked users ids")
    object_status = models.SmallIntegerField(choices=ObjectStatusChoices.CHOICES,default=0)

    def __str__(self):
        return self.name

class Content(BaseFindModel):
    user = models.ForeignKey(ContentUser,on_delete=models.SET_NULL,null=True)
    description = models.TextField(blank=True, null=True)
    place = models.CharField(max_length=100, blank=True, null=True , help_text="content upload location reference")
    contenttype= models.IntegerField(choices = ContentType.CHOICES)
    associate_media = models.FileField(upload_to='textpost/media/', help_text="media file asscociated with text post",blank=True,null=True)
    fontfamilly = models.CharField(max_length=150, blank=True, null=True, help_text="font family for text post")
    media = models.FileField(upload_to='content/media',blank=True,null=True)
    textpostcontent = models.TextField(blank=True, null=True, help_text="content for text post")
    medialist = models.TextField(blank=True, null=True, help_text="list of media file urls")
    chatInvited = models.BooleanField(default=False)
    commentinvited = models.BooleanField(default=True)
    notappropriate = models.BooleanField(default=False)
    secret = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    
    def __str__(self):
        return self.user.name

class ContentCategoryMapping(BaseFindModel):
    category = models.IntegerField(choices=ContentCategory.CHOICES)
    content = models.ForeignKey(Content,on_delete=models.CASCADE)

class Advertisement(BaseFindModel):
    user = models.BigIntegerField(help_text="reference of Advertise partner id")
    media = models.FileField(upload_to='adv/media')
    mediahref = models.TextField(help_text="after click url detail")
    is_active = models.BooleanField(default=True)

class AdvertisementCategoryMapping(BaseFindModel):
    category = models.IntegerField(choices=ContentCategory.CHOICES)
    content = models.ForeignKey(Advertisement,on_delete=models.CASCADE)

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