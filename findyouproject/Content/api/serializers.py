from rest_framework import serializers
from Content.models import Content, ContentUser

class ContentUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = ContentUser
        exclude = ["id","object_status","Interest","country","state","city","BlockList"]

class ContentSerializer(serializers.ModelSerializer):
    user = serializers.SerializerMethodField()

    class Meta:
        model = Content
        exclude = ["updated_on","object_status","updated_by","is_active"]

    def get_user(self,obj):
        serializer_data = ContentUserSerializer(obj.user)
        return serializer_data.data