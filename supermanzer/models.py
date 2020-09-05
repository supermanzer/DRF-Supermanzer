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
