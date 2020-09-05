from django.contrib.admindocs.urls import urlpatterns
from django.urls import include, path
from rest_framework.routers import DefaultRouter
from supermanzer import views


# Create a DRF Router instance
router = DefaultRouter()
# Register endpoits with it
router.register(r'projects', views.ProjectViewSet)

# Inlcude router's auto-generated URLs in the urlpatterns
urlpatterns = [
    path('', include(router.urls))
]
