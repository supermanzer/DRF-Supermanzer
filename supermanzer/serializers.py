"""SUPERMANZER SERIALIZERS

The class(es) defined here control how the data in the models are rendered in the API
"""

from rest_framework import serializers
from .models import Project, ProjectSection


class SectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProjectSection
        fields = ['id', 'class_string', 'is_markdown', 'text']


class ProjectSerializer(serializers.ModelSerializer):
    sections = SectionSerializer(many=True, read_only=True)

    class Meta:
        model = Project
        fields = ['id', 'date_created', 'date_modified',
                  'title', 'summary', 'github_url', 'image_url', 'sections']
