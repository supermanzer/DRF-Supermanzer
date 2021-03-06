# Generated by Django 3.1.1 on 2020-09-04 20:50

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Project',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_created', models.DateField(auto_now_add=True, verbose_name='Date Created')),
                ('date_modified', models.DateField(auto_now=True, verbose_name='Date Created')),
                ('title', models.CharField(max_length=200)),
                ('github_url', models.CharField(max_length=200)),
                ('image_url', models.CharField(max_length=100)),
                ('summary', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='ProjectSection',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('class_string', models.CharField(blank=True, max_length=200)),
                ('is_markdown', models.BooleanField(default=False, help_text='Wether the text of this section should be rendered as Markdown or not.')),
                ('text', models.TextField()),
                ('project', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='sections', to='supermanzer.project')),
            ],
        ),
    ]
