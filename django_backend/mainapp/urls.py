from django.urls import path, include
from rest_framework import routers
from rest_framework.authtoken import views as authtoken_views
from django.conf import settings
from django.conf.urls.static import static
from . import models
from . import views



router = routers.DefaultRouter()
router.register(r'users', views.UserViewSet)
router.register(r'runners', views.RunnerViewSet)
router.register(r'genders', views.GenderViewSet)
router.register(r'countries', views.CountriesViewSet)
router.register(r'volunteers', views.VolunteerViewSet)
router.register(r'charities', views.CharityViewSet)
router.register(r'sponsorships', views.SponsorshipViewSet)
router.register(r'registrations', views.RegistrationViewSet)
router.register(r'race-kit-options', views.RaceKitOptionViewSet)
router.register(r'registration-statuses', views.RegistrationStatusViewSet)


urlpatterns = [
    path('', include(router.urls)),
    path('sign-up', views.SignUpView.as_view()),
    path('api-token-auth', authtoken_views.obtain_auth_token),
    path('hello-world', views.HelloWorld.as_view()),
    path('upload-volunteers', views.VolunteerUploadView.as_view()),
    path('sponsorships/by-registration/<int:registration_id>/', views.SponsorshipsByRegistration.as_view()),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)