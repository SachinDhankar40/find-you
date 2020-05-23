import requests
from django.conf import settings

def contentUserCreate(request,user_id):
    userId = user_id
    country = request.data.get('country',False)
    state = request.data.get('state',False)
    city = request.data.get('city',False)
    name=request.data.get('firstName',False)+" "+request.data.get('lastName',"")
    data={"userId":userId,"country":int(country),"state":int(state),"city":int(city),"name":name,"action":"create"}
    url=settings.CONTENT_SERVICE+"/api/v1/content/content-user"
    html_request = requests.post(url,data=data)
    return html_request

def contentUserUpdate(request,user_id):
    userId = user_id
    country = request.data.get('country',False)
    state = request.data.get('state',False)
    city = request.data.get('city',False)
    name=request.data.get('firstName',False)+" "+request.data.get('lastName',"")
    data={"userId":userId,"country":int(country),"state":int(state),"city":int(city),"name":name}
    url=settings.CONTENT_SERVICE+"/api/v1/content/content-user-update"
    html_request = requests.post(url,data=data)
    return html_request

def contentUserUpdateProfilepic(url_path,user_id):
    userId = user_id
    data={"userId":userId,"url_path":url_path}
    url=settings.CONTENT_SERVICE+"/api/v1/content/content-user-update-pic"
    html_request = requests.post(url,data=data)
    return html_request

def contenList(request):
    url = settings.CONTENT_SERVICE+"/api/v1/content/content-listing"
    html_request = requests.get(url)
    return html_request