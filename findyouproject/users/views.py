from django.shortcuts import render
from .models import User
from django.db.models import Q

def authenticateUser(userdetails,password):
    req_user = User.objects.filter(Q(mobile=userdetails)|Q(email=userdetails))
    if req_user.exists():
        password_is = req_user[0].check_password(password)
        if password_is:
            return req_user[0]
        else:
            return None
    else:
        return None