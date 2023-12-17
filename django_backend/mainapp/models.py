from django.db import models
from django.contrib.auth.models import AbstractUser

from .managers import UserManager
    

class Gender(models.Model):
    name = models.CharField(max_length=80)

    def __str__(self) -> str:
        return self.name


class Country(models.Model):
    IMAGES_PATH = 'images/country_flags'
    name = models.CharField(max_length=80, unique=True)
    code = models.CharField(max_length=3, unique=True)
    flag = models.ImageField(upload_to=IMAGES_PATH)

    def __str__(self) -> str:
        return self.name


class User(AbstractUser):
    ADMIN = 'A'
    COORDINATOR = 'C'
    RUNNER = 'R'

    ROLES = (
        (ADMIN, 'Admin'),
        (COORDINATOR, 'Coordinator'),
        (RUNNER, 'Runner')
    )

    username = None
    email = models.EmailField(unique=True)
    first_name = models.CharField(max_length=80)
    last_name = models.CharField(max_length=80)
    role = models.CharField(max_length=1, choices=ROLES, default=RUNNER)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = UserManager()

    def __str__(self) -> str:
        return str(self.email)


class Runner(models.Model):
    user = models.OneToOneField(User, on_delete=models.PROTECT)
    gender = models.ForeignKey(Gender, on_delete=models.PROTECT)
    date_of_birth = models.DateField()
    country = models.ForeignKey(Country, on_delete=models.PROTECT)

    def __str__(self) -> str:
        return str(self.user)
    

class EventType(models.Model):
    name = models.CharField(max_length=80, unique=True)

    def __str__(self) -> str:
        return self.name


class Marathon(models.Model):
    name = models.CharField(max_length=80)
    city_name = models.CharField(max_length=80)
    country = models.ForeignKey(Country, on_delete=models.PROTECT)
    year_held = models.IntegerField()

    def __str__(self) -> str:
        return self.name


class Event(models.Model):
    name = models.CharField(max_length=80)
    code = models.CharField(max_length=6, unique=True)
    event_type = models.ForeignKey(EventType, on_delete=models.PROTECT)
    marathon = models.ForeignKey(Marathon, on_delete=models.PROTECT)
    start_date_time = models.DateTimeField()
    cost = models.DecimalField(max_digits=10, decimal_places=2)
    max_participants = models.PositiveIntegerField()


class RegistrationStatus(models.Model):
    status = models.CharField(max_length=80, unique=True)

    def __str__(self) -> str:
        return self.status
    

class RaceKitOption(models.Model):
    race_kit_option = models.CharField(max_length=80)
    cost = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return self.race_kit_option


class Charity(models.Model):
    IMAGES_PATH = 'images/charity_logos'
    name = models.CharField(max_length=80)
    description = models.CharField(max_length=2000)
    logo = models.ImageField(upload_to=IMAGES_PATH)

    def __str__(self) -> str:
        return self.name


class Registration(models.Model):
    runner = models.ForeignKey(Runner, on_delete=models.PROTECT)
    date_time = models.DateTimeField()
    race_kit_option = models.ForeignKey(RaceKitOption, on_delete=models.PROTECT)
    registration_status = models.ForeignKey(RegistrationStatus, on_delete=models.PROTECT)
    cost = models.DecimalField(max_digits=10, decimal_places=2)
    charity = models.ForeignKey(Charity, on_delete=models.PROTECT)
    sponsorship_target = models.DecimalField(max_digits=10, decimal_places=2)


class RegistrationEvent(models.Model):
    registration = models.ForeignKey(Registration, on_delete=models.PROTECT)
    event = models.ForeignKey(Event, on_delete=models.PROTECT)
    bib_number = models.IntegerField()
    race_time = models.IntegerField(null=True)


class Sponsorship(models.Model):
    name = models.CharField(max_length=80)
    registration = models.ForeignKey(Registration, on_delete=models.PROTECT)
    amount = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self) -> str:
        return self.name
    

class Volunteer(models.Model):
    first_name = models.CharField(max_length=80)
    last_name = models.CharField(max_length=80)
    country = models.ForeignKey(Country, on_delete=models.PROTECT)
    gender = models.ForeignKey(Gender, on_delete=models.PROTECT)

    def __str__(self) -> str:
        return f'{self.first_name} {self.last_name}'
