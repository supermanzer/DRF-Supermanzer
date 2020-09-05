from django.contrib import admin
from .models import Project, ProjectSection
# Register your models here.


class SectionInline(admin.TabularInline):
    model = ProjectSection
    extra = 0


@admin.register(Project)
class ProjectAdmin(admin.ModelAdmin):
    list_display = ('title', 'date_created', 'date_modified')
    inlines = [SectionInline, ]
