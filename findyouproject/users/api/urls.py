from django.urls import path
from . import views

urlpatterns = [
    path('/create-user', views.UserCreate.as_view(),name="UserCreate"),
    path('/update-user', views.UserUpdate.as_view(),name="UserUpdate"),
    path('/update-profile-pic', views.UserUpdatePic.as_view(),name="UserUpdatePic"),
    path('/content-list', views.ContentList.as_view(),name="ContentList"),
]