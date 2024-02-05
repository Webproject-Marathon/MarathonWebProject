'''
Run these tests after:
$ python manage.py migrate
$ python manage.py populate_db
'''

from rest_framework import status
from rest_framework.test import APITestCase
from django.core.management import call_command



class Tests(APITestCase):
    users_credentials = [
        ('runner@runner.com', '1'),
        ('coord@coord.com', '1'),
        ('admin@admin.com', '1'),
    ]

    def setUp(self):
        print('Setting up database')
        call_command('populate_db')

    def test_runners_management_list_get(self):
        url = '/runner-management/'
        response = self.client.get(url, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_login(self):
        url = '/api-token-auth/'
        for email, password in self.users_credentials: 
            good_data = { 'email': email, 'password': password }
            good_response = self.client.post(url, good_data, format='json')
            self.assertEqual(good_response.status_code, status.HTTP_200_OK)

            bad_data = { 'email': email, 'password': password + 'pisbka' }
            bad_response = self.client.post(url, bad_data, format='json')
            self.assertEqual(bad_response.status_code, status.HTTP_400_BAD_REQUEST)

    def test_runner_registration(self):
        url = '/runners/'
        data = {
            'date_of_birth': '1969-12-12',
            'user': 'http://127.0.0.1:8000/users/3/',
            'gender': 'http://127.0.0.1:8000/genders/1/',
            'country': 'http://127.0.0.1:8000/countries/92/',
        }
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
