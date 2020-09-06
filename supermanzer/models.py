from random import choices
from turtle import heading
from django.db import models

# Create your models here.


class ProjectSection(models.Model):
    project = models.ForeignKey(
        'Project', on_delete=models.CASCADE, related_name='sections')
    class_string = models.CharField(
        max_length=200, blank=True)
    heading = models.CharField(max_length=100, blank=True)
    is_markdown = models.BooleanField(
        default=False, help_text='Wether the text of this section should be rendered as Markdown or not.')
    text = models.TextField()


class Project(models.Model):
    date_created = models.DateField(
        auto_now_add=True, verbose_name='Date Created', editable=False)
    date_modified = models.DateField(
        auto_now=True, verbose_name='Date Created', editable=False)
    title = models.CharField(max_length=200)
    github_url = models.CharField(max_length=200)
    image_url = models.CharField(max_length=100)
    summary = models.TextField()


class AboutSection(models.Model):
    class ComponentElements(models.TextChoices):
        EXPANSION_PANEL = 'EP', 'Expansion Panel'
        LIST = 'LI', 'List'
        TABS = 'TA', 'Tabs'

    class ComponentPositions(models.TextChoices):
        BELOW = 'be', 'Below (full width)'
        RIGHT = 'ri', 'Right (half width)'
        LEFT = 'le', 'Left (half width)'

    heading = models.CharField(max_length=100)
    icon = models.CharField(
        max_length=50, help_text='The Material Design icon to be added to this heading')
    text = models.TextField(
        help_text='The text that comes after the heading, before the subsections')
    component_element = models.CharField(
        max_length=2, choices=ComponentElements.choices)
    component_position = models.CharField(
        max_length=2, choices=ComponentPositions.choices)


class AboutComponent(models.Model):
    heading = models.CharField(max_length=50)
    icon = models.CharField(max_length=20)
    text = models.TextField()
    section = models.ForeignKey(
        'AboutSection', related_name='components', on_delete=models.CASCADE)
