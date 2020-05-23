from django.shortcuts import render
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from django.views.generic import CreateView
from django.views.generic import TemplateView, View
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions,authentication,generics
from users.models import User , FindyouUser, CscDetails
import re
from .service import contentUserCreate, contentUserUpdate, contentUserUpdateProfilepic, contenList
import json
from django.db.models import Q
from django.core.files.storage import FileSystemStorage

regex_var_email = re.compile('^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$')
regex_var_mobile = re.compile('^[5-9][0-9]{9}$')

def render_response(data=None, status=None, error=None):
    if not isinstance(error, list):
        error = [error]

    if data and status:
        return Response({'data': data, 'error': [], 'status': status})
    return Response({'data': None, 'errors': error, 'status': status})

class UserCreate(APIView):
    permission_classes = [permissions.AllowAny]

    def delete(self,request,*args,**kwargs):
        pass

    def post(self, request, *args, **kwargs):
        firstName = request.data.get('firstName',False)
        lastName = request.data.get('lastName',"")
        country = request.data.get('country',False)
        state = request.data.get('state',False)
        city = request.data.get('city',False)
        action = request.data.get('action',False)
        mobile = request.data.get('mobile',False)
        email = request.data.get('email',False)
        password = request.data.get('password',False)
        if firstName and country and state and city and action and mobile and email and password:
            if action == "create":
                check_mobile = bool(regex_var_mobile.search(mobile))
                check_email = bool(regex_var_email.search(email))
                if check_email == True and check_mobile == True:
                    mobile,email=mobile,email
                    req_pre_exist = User.objects.filter(Q(mobile=mobile)|Q(email=email))
                    if len(req_pre_exist)!=0:
                        return render_response(data="", error="user already exists", status=0)
                    req_user = User.objects.create(username=mobile,firstName=firstName,lastName=lastName,country_id=int(country),state_id=int(state),\
                        city_id=int(city),mobile=mobile,email=email)
                    req_user.set_password(password)
                    req_user.save()
                    income_response = contentUserCreate(request,req_user.id)
                    if income_response.status_code == 200:
                        if json.loads(income_response.content).get("status")==1:
                            FindyouUser.objects.create(user_id=req_user.id)
                            return render_response(data="User successfully created", error="", status=1)
                        else:
                            User.objects.filter(id=req_user.id).delete()
                            return render_response(data="", error="user not created", status=0)
                    else:
                        User.objects.filter(id=req_user.id).delete()
                        return render_response(data="", error="user not created", status=0)
                else:
                    return render_response(data="", error="email or mobile not valid", status=0)
                
        else:
            return render_response(data="", error="Invalid input for content user creation", status=0)

class UserUpdate(APIView):
    permission_classes = [permissions.AllowAny]

    def post(self, request, *args, **kwargs):
        userId = request.data.get('userId',False)
        firstName = request.data.get('firstName',False)
        lastName = request.data.get('lastName',"")
        country = request.data.get('country',False)
        state = request.data.get('state',False)
        city = request.data.get('city',False)
        gender = request.data.get('gender',False)
        description = request.data.get('description')
        if firstName and country and state and city and userId:
            income_response = contentUserUpdate(request,userId)
            if income_response.status_code == 200:
                if json.loads(income_response.content).get("status")==1:
                    req_user = User.objects.filter(id=userId).update(firstName=firstName,lastName=lastName,country=country,state=state,\
                        city=city)
                    if gender:
                        User.objects.filter(id=userId).update(gender=gender)
                    if description:
                        FindyouUser.objects.filter(user_id=userId).update(description=description)
                    return render_response(data="User successfully updated", error="", status=1)
                else:
                    return render_response(data="", error="user not updated", status=0)
            else:
                return render_response(data="", error="user not updated", status=0)

class UserUpdatePic(APIView):
    permission_classes = [permissions.AllowAny]

    def post(self, request, *args, **kwargs):
        userId = request.data.get('userId',False)
        profile = request.FILES.get('profilepic')
        coverpic = request.FILES.get('coverpic')
        if userId:
            if coverpic:
                fs2=FileSystemStorage()
                fs2.save(coverpic.name, coverpic)
                update_user2= FindyouUser.objects.filter(user_id=userId).update(coverpic=coverpic)
            if profile:
                fs1=FileSystemStorage()
                fs1.save(profile.name, profile)
                update_user= User.objects.filter(id=userId).update(profile_picture=profile)
                income_response = contentUserUpdateProfilepic(User.objects.filter(id=userId)[0].profile_picture.url,userId)
                if income_response.status_code == 200:
                    if json.loads(income_response.content).get("status")==1:
                        return render_response(data="User successfully updated", error="", status=1)
                    else:
                        return render_response(data="", error="user not updated", status=0)
                else:
                    return render_response(data="", error="user not updated", status=0)
            else:
                return render_response(data="", error="no info provided", status=0)
        else:
            return render_response(data="", error="no info provided", status=0)

class ContentList(APIView):
    permission_classes = [permissions.AllowAny]

    def get(self,request,*args,**kwargs):
        income_response = contenList(request)
        if income_response.status_code == 200:
            if json.loads(income_response.content).get("status")==1:
                return render_response(data=json.loads(income_response.content).get("data"), error="", status=1)
            else:
                return render_response(data="", error="No response from service", status=0)
        else:
            return render_response(data="", error="No response from service", status=0)