from django.contrib.auth import authenticate
from django.shortcuts import get_object_or_404
from rest_framework import serializers, exceptions
from django.utils.translation import gettext as _
from . import models as my_models

class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = my_models.User
        fields = ['url', 'email', 'first_name', 'last_name', 'password', 'role']

    def create(self, validated_data):
        user = my_models.User.objects.create_user(**validated_data)
        return user

class RunnerSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = my_models.Runner
        fields = '__all__'

class GenderSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = my_models.Gender
        fields = '__all__'

class CountrySerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = my_models.Country
        fields =  '__all__'

class RunnerProfileSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = my_models.Runner
        fields = ['date_of_birth', 'gender', 'country']

class VolunteerSerializer(serializers.HyperlinkedModelSerializer):
    country_name = serializers.CharField(source='country.name', read_only=True)
    gender_name = serializers.CharField(source='gender.name', read_only=True)
    class Meta:
        model = my_models.Volunteer
        fields = ['url', 'first_name', 'last_name', 'country', 'country_name', 'gender', 'gender_name']

class CharitySerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = my_models.Charity
        fields = ['name', 'description', 'logo']

class SponsorshipSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = my_models.Sponsorship
        fields = ['name', 'registration', 'amount']

class RegistrationSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = my_models.Registration
        fields = '__all__'

class RaceKitOptionSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = my_models.RaceKitOption
        fields = '__all__'

class RegistrationStatusSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = my_models.RegistrationStatus
        fields = '__all__'

class RegistrationEventSerializer(serializers.HyperlinkedModelSerializer):
    country_name = serializers.CharField(source='registration.runner.country.name', read_only=True)
    runner_first_name = serializers.CharField(source='registration.runner.user.first_name', read_only=True)
    runner_last_name = serializers.CharField(source='registration.runner.user.last_name', read_only=True)

    class Meta:
        model = my_models.RegistrationEvent
        fields = '__all__'

class EventSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = my_models.Event
        fields = '__all__'

class EventTypeSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = my_models.EventType
        fields = '__all__'

class MarathonSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = my_models.Marathon
        fields = '__all__'

class SignUpSerializer(serializers.ModelSerializer):
    runner_profile = RunnerProfileSerializer(required=True)

    class Meta:
        model = my_models.User
        fields = ['email', 'first_name', 'last_name', 'password', 'role', 'runner_profile']
    
    def create(self, validated_data):
        user_data = validated_data.copy()
        user_data.pop('runner_profile')
        runner_data = validated_data['runner_profile']
        user = my_models.User.objects.create(**user_data)
        my_models.Runner.objects.create(user=user, **runner_data)
        return user
    
class AuthTokenSerializer(serializers.Serializer):
    email = serializers.EmailField()
    password = serializers.CharField(style={'input_type': 'password'})

    def validate(self, data):
        email = data.get('email')
        password = data.get('password')

        if email and password:
            user = authenticate(email=email, password=password)

            if user:
                if not user.is_active:
                    msg = _('User account is disabled.')
                    raise exceptions.ValidationError(msg)
            else:
                msg = _('Unable to log in with provided credentials.')
                raise exceptions.ValidationError(msg)
        else:
            msg = _('Must include "email" and "password".')
            raise exceptions.ValidationError(msg)

        data['user'] = user
        return data
    
class VolunteerCSVSerializer(serializers.Serializer):
    volunteer_id = serializers.IntegerField()
    first_name = serializers.CharField(max_length=80)
    last_name = serializers.CharField(max_length=80)
    country_code = serializers.CharField(max_length=3)
    gender = serializers.CharField(max_length=1)

    def create(self, validated_data):
        pk = validated_data.pop('volunteer_id')
        country_code = validated_data.pop('country_code')
        gender = {'F': 'Female', 'M': 'Male'}[validated_data.pop('gender')]

        country = my_models.Country.objects.get(code=country_code)
        gender = my_models.Gender.objects.get(name=gender)

        data = dict(country=country, gender=gender, **validated_data)
        volunteer, is_created = my_models.Volunteer.objects.get_or_create(pk=pk, defaults=data)
        if not is_created:
            volunteer.country = country
            volunteer.gender = gender
            volunteer.first_name = data['first_name']
            volunteer.last_name = data['last_name']
            volunteer.save()
        return volunteer