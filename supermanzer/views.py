from rest_framework import viewsets

from .models import AboutSection, Project
from .serializers import AboutSectionSerializer, ProjectSerializer


# Create your views here.


class ProjectViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = ProjectSerializer
    queryset = Project.objects.all()


class AboutViewset(viewsets.ReadOnlyModelViewSet):
    serializer_class = AboutSectionSerializer
    queryset = AboutSection.objects.all()
