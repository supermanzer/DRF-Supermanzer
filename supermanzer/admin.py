from django.contrib import admin
from .models import AboutComponent, AboutSection, Project, ProjectSection
# Register your models here.

# INLINE COMPONENTS


class SectionInline(admin.TabularInline):
    model = ProjectSection
    extra = 0


class ComponentInline(admin.TabularInline):
    model = AboutComponent
    extra = 0

# REGISTERED MODELS


@admin.register(Project)
class ProjectAdmin(admin.ModelAdmin):
    list_display = ('title', 'date_created', 'date_modified')
    inlines = [SectionInline, ]


@admin.register(AboutSection)
class AboutAdmin(admin.ModelAdmin):
    list_display = ('heading', 'component_element', 'component_position')
    inlines = [ComponentInline, ]
