from django.urls import path
from . import views

urlpatterns = [
    path('/content-user', views.ContentUserCreate.as_view(),name="ContentUserCreate"),
    path('/content-user-update', views.ContentUserUpdate.as_view(),name="ContentUserUpdate"),
    path('/content-user-update-pic', views.ContentUserUpdatePic.as_view(),name="ContentUserUpdatePic"),
    path('/content-listing', views.ContentContentList.as_view(),name="ContentContentList"),
]