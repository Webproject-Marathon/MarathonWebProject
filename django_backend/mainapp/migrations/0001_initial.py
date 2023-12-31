# Generated by Django 4.2.7 on 2023-12-13 15:54

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('email', models.EmailField(max_length=254, unique=True)),
                ('first_name', models.CharField(max_length=80)),
                ('last_name', models.CharField(max_length=80)),
                ('role', models.CharField(choices=[('A', 'Admin'), ('C', 'Coordinator'), ('R', 'Runner')], default='R', max_length=1)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': 'user',
                'verbose_name_plural': 'users',
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Charity',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=80)),
                ('description', models.CharField(max_length=2000)),
                ('logo', models.ImageField(upload_to='images/charity_logos')),
            ],
        ),
        migrations.CreateModel(
            name='Country',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=80, unique=True)),
                ('code', models.CharField(max_length=3, unique=True)),
                ('flag', models.ImageField(upload_to='images/country_flags')),
            ],
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=80)),
                ('code', models.CharField(max_length=6, unique=True)),
                ('start_date_time', models.DateTimeField()),
                ('cost', models.DecimalField(decimal_places=2, max_digits=10)),
                ('max_participants', models.PositiveIntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='EventType',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=80, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='Gender',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=80)),
            ],
        ),
        migrations.CreateModel(
            name='RaceKitOption',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('race_kit_option', models.CharField(max_length=80)),
                ('cost', models.DecimalField(decimal_places=2, max_digits=10)),
            ],
        ),
        migrations.CreateModel(
            name='Registration',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_time', models.DateTimeField()),
                ('cost', models.DecimalField(decimal_places=2, max_digits=10)),
                ('sponsorship_target', models.DecimalField(decimal_places=2, max_digits=10)),
                ('charity', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='mainapp.charity')),
                ('race_kit_option', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='mainapp.racekitoption')),
            ],
        ),
        migrations.CreateModel(
            name='RegistrationStatus',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(max_length=80, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='Volunteer',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=80)),
                ('last_name', models.CharField(max_length=80)),
                ('country', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='mainapp.country')),
                ('gender', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='mainapp.gender')),
            ],
        ),
        migrations.CreateModel(
            name='Sponsorship',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=80)),
                ('amount', models.DecimalField(decimal_places=2, max_digits=10)),
                ('registration', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='mainapp.registration')),
            ],
        ),
        migrations.CreateModel(
            name='Runner',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_of_birth', models.DateField()),
                ('country', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='mainapp.country')),
                ('gender', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='mainapp.gender')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.PROTECT, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='RegistrationEvent',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bib_number', models.IntegerField()),
                ('race_time', models.IntegerField(null=True)),
                ('event', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='mainapp.event')),
                ('registration', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='mainapp.registration')),
            ],
        ),
        migrations.AddField(
            model_name='registration',
            name='registration_status',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='mainapp.registrationstatus'),
        ),
        migrations.AddField(
            model_name='registration',
            name='runner',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='mainapp.runner'),
        ),
        migrations.CreateModel(
            name='Marathon',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=80)),
                ('city_name', models.CharField(max_length=80)),
                ('year_held', models.IntegerField()),
                ('country', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='mainapp.country')),
            ],
        ),
        migrations.AddField(
            model_name='event',
            name='event_type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='mainapp.eventtype'),
        ),
        migrations.AddField(
            model_name='event',
            name='marathon',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='mainapp.marathon'),
        ),
    ]
