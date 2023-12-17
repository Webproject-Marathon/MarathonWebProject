import csv
from rest_framework import generics, status, viewsets, filters
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.parsers import FormParser, MultiPartParser
from django.db import models
from . import models as my_models
from . import serializers as my_serializers


class HelloWorld(APIView):
    def get(self, request, format=None):
        return Response('hello world!')
    
class UserViewSet(viewsets.ModelViewSet):
    queryset = my_models.User.objects.all()
    serializer_class = my_serializers.UserSerializer

class GenderViewSet(viewsets.ModelViewSet):
    queryset = my_models.Gender.objects.all()
    serializer_class = my_serializers.GenderSerializer

class CountriesViewSet(viewsets.ModelViewSet):
    queryset = my_models.Country.objects.all()
    serializer_class = my_serializers.CountrySerializer

class RunnerViewSet(viewsets.ModelViewSet):
    queryset = my_models.Runner.objects.all()
    serializer_class = my_serializers.RunnerSerializer

class VolunteerViewSet(viewsets.ModelViewSet):
    queryset = my_models.Volunteer.objects.all()
    serializer_class = my_serializers.VolunteerSerializer
    filter_backends = [filters.OrderingFilter]
    ordering_fields = ['first_name', 'last_name', 'country__name', 'gender__name']

class CharityViewSet(viewsets.ModelViewSet):
    queryset = my_models.Charity.objects.all()
    serializer_class = my_serializers.CharitySerializer

class SponsorshipViewSet(viewsets.ModelViewSet):
    queryset = my_models.Sponsorship.objects.all()
    serializer_class = my_serializers.SponsorshipSerializer

class SponsorshipsByRegistration(APIView):
    serializer_class = my_serializers.SponsorshipSerializer

    def get(self, request, registration_id, format=None):
        sponsorships = my_models.Sponsorship.objects.filter(registration_id=registration_id)
        sponsorships_serialized = my_serializers.SponsorshipSerializer(sponsorships, many=True, context={'request': request})
        print(sponsorships_serialized)
        total_amount = sponsorships.aggregate(total_amount=models.Sum('amount'))['total_amount']
        response_data = {
            'sponsorships': sponsorships_serialized.data,
            'total_amount': total_amount
        }
        return Response(response_data)


class RegistrationViewSet(viewsets.ModelViewSet):
    queryset = my_models.Registration.objects.all()
    serializer_class = my_serializers.RegistrationSerializer

class RaceKitOptionViewSet(viewsets.ModelViewSet):
    queryset = my_models.RaceKitOption.objects.all()
    serializer_class = my_serializers.RaceKitOptionSerializer

class RegistrationStatusViewSet(viewsets.ModelViewSet):
    queryset = my_models.RegistrationStatus.objects.all()
    serializer_class = my_serializers.RegistrationStatusSerializer

class SignUpView(generics.CreateAPIView):
    queryset = my_models.Runner.objects.all()
    serializer_class = my_serializers.SignUpSerializer

    def create(self, request, *args, **kwargs):
        # Extract runner_profile data from the request data
        user_data = request.data.copy()
        runner_profile_data = user_data.pop('runner_profile', None)

        # Validate and create the user object
        serializer = my_serializers.UserSerializer(data=user_data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()

        # If there is runner_profile data, create the Runner object
        if runner_profile_data:
            runner_serializer = my_serializers.RunnerSerializer(user=user, data=runner_profile_data)
            runner_serializer.is_valid(raise_exception=True)
            runner_serializer.save(user=user)

        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

class VolunteerUploadView(APIView):
    parser_classes = (MultiPartParser, FormParser)
    
    def post(self, request, *args, **kwargs):
        if 'file' not in request.FILES:
            return Response({'error': 'No file sent'}, status=status.HTTP_400_BAD_REQUEST)
        file = request.FILES['file']

        if not file.name.endswith('.csv'):
            return Response({'error': 'Invalid file format'}, status=status.HTTP_400_BAD_REQUEST)

        volunteers = []
        try:
            decoded_file = file.read().decode('utf-8')
            csv_reader = csv.DictReader(decoded_file.splitlines())
            allowed_field_names = ['VolunteerId', 'FirstName', 'LastName', 'CountryCode', 'Gender']
            for field_name in csv_reader.fieldnames:
                if field_name not in allowed_field_names:
                    return Response({'error': f'Fields in csv are incorrect. Invalid field name: {field_name}'}, status=status.HTTP_400_BAD_REQUEST)
            for row in csv_reader:
                row = dict(
                    volunteer_id=row['VolunteerId'],
                    first_name=row['FirstName'],
                    last_name=row['LastName'],
                    country_code=row['CountryCode'],
                    gender=row['Gender']
                )
                serializer = my_serializers.VolunteerCSVSerializer(data=row)
                serializer.is_valid(raise_exception=True)
                volunteers.append(serializer.save())
        except Exception as e:
            return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        return Response({'success': f'{len(volunteers)} volunteers processed'}, status=status.HTTP_201_CREATED)