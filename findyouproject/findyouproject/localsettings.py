import os
# instutite_microservice_class = "http://localhost:8000/institute/institutes/"


BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

ALLOWED_HOSTS = ['*']

DATABASES = {
   'default': {
       'ENGINE': 'django.db.backends.mysql',
       'NAME': 'findyou',
       'USER':'findyou',
       'PASSWORD':'findyou',
       'HOST':'',
       'PORT':'3306',
   }
}
# DATABASES = {
#      'default': {
#          'ENGINE': 'django.db.backends.sqlite3',
#          'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
#      }
# }