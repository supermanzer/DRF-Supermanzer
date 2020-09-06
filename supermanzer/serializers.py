"""SUPERMANZER SERIALIZERS

The class(es) defined here control how the data in the models are rendered in the API
"""

from rest_framework import serializers
from .models import AboutComponent, AboutSection, Project, ProjectSection


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


class ComponentSerializer(serializers.ModelSerializer):
    class Meta:
        model = AboutComponent
        fields = '__all__'


class AboutSectionSerializer(serializers.ModelSerializer):
    components = ComponentSerializer(many=True, read_only=True)

    class Meta:
        model = AboutSection
        fields = ['id', 'heading', 'icon', 'text',
                  'component_element', 'component_position', 'components']
