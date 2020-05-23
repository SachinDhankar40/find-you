from django.shortcuts import render
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from django.views.generic import CreateView
from django.views.generic import TemplateView, View
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions,authentication,generics
from Content.models import ContentUser, Content
from .serializers import ContentSerializer

def render_response(data=None, status=None, error=None):
    if not isinstance(error, list):
        error = [error]

    if data and status:
        return Response({'data': data, 'error': [], 'status': status})
    return Response({'data': None, 'errors': error, 'status': status})

class ContentUserCreate(APIView):
    permission_classes = [permissions.AllowAny]

    def update(self,request,*args,**kwargs):
        pass

    def delete(self,request,*args,**kwargs):
        pass

    def post(self, request, *args, **kwargs):
        userId = request.POST.get('userId',False)
        name = request.POST.get('name',False)
        country = request.POST.get('country',False)
        state = request.POST.get('state',False)
        city = request.POST.get('city',False)
        action = request.POST.get('action',False)
        if userId and name and country and state and city and action:
            if action == "create":
                try:
                    req = ContentUser.objects.get(userId=userId)
                    return render_response(data="User already exists", error=[], status=1)
                except:
                    ContentUser.objects.create(userId=userId,name=name,country=int(country),state=int(state),city=int(city))
                    return render_response(data="Contentuser created successfully", error=[], status=1)
        else:
            return render_response(data="", error="Invalid input for content user creation", status=0)

class ContentUserUpdate(APIView):
    permission_classes = [permissions.AllowAny]

    def post(self, request, *args, **kwargs):
        userId = request.POST.get('userId',False)
        name = request.POST.get('name',False)
        country = request.POST.get('country',False)
        state = request.POST.get('state',False)
        city = request.POST.get('city',False)
        if userId and name and country and state and city:
            ContentUser.objects.filter(userId=userId).update(name=name,country=country,state=state,city=city)
            return render_response(data="Contentuser updated successfully", error=[], status=1)
        else:
            return render_response(data="", error="Invalid input for content user creation", status=0)

class ContentUserUpdatePic(APIView):
    permission_classes = [permissions.AllowAny]

    def post(self, request, *args, **kwargs):
        userId = request.POST.get('userId',False)
        url_path = request.POST.get('url_path',False)
        if userId and url_path :
            ContentUser.objects.filter(userId=userId).update(profile_picture=url_path)
            return render_response(data="Contentuser updated successfully", error=[], status=1)
        else:
            return render_response(data="", error="Invalid input for content user creation", status=0)

class ContentContentList(generics.ListCreateAPIView):
    permission_classes = [permissions.AllowAny]
    queryset = Content.objects.all()
    serializer_class = ContentSerializer

    def list(self,request,*args,**kwargs):
        queryset = Content.objects.filter(is_active=True, object_status=0)
        serializer_data = self.serializer_class(queryset,many=True)
        return render_response(data=serializer_data.data, error=[], status=1)