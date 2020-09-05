from rest_framework import viewsets
from .models import Project
from .serializers import ProjectSerializer

# Create your views here.


class ProjectViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = ProjectSerializer
    queryset = Project.objects.all()
