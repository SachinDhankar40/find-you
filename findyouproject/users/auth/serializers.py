from rest_framework import serializers
from rest_framework.authtoken.models import Token
from users.models import (User,FindyouUser)

class LoginSerializer(serializers.Serializer):
    password = serializers.CharField(
        write_only=True,
        required=True,
        help_text='Leave empty if no change needed',
        style={'input_type': 'password', 'placeholder': 'Password'}
    )
    username = serializers.CharField()

    class Meta:
        fields = ['username', 'password']

class UserSerializer(serializers.ModelSerializer):
    auth_token = serializers.SerializerMethodField()
    name = serializers.SerializerMethodField()
    class Meta:
        model = User
        fields = ['username', 'name', 'email', 'mobile', 'auth_token']

    def get_auth_token(self, obj):
        get_token = Token.objects.filter(user=obj)
        if get_token.exists():
            get_token.delete()
            Token.objects.create(user=obj)
        token, created = Token.objects.get_or_create(user=obj)
        return token.key
    
    def get_name(self,obj):
        return obj.firstName+" "+obj.lastName