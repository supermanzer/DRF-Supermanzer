# Generated by Django 3.1.1 on 2020-09-06 21:26

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('supermanzer', '0002_projectsection_heading'),
    ]

    operations = [
        migrations.CreateModel(
            name='AboutSection',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('heading', models.CharField(max_length=100)),
                ('icon', models.CharField(help_text='The Material Design icon to be added to this heading', max_length=50)),
                ('text', models.TextField(help_text='The text that comes after the heading, before the subsections')),
                ('component_element', models.CharField(choices=[('EP', 'Expansion Panel'), ('LI', 'List'), ('TA', 'Tabs')], max_length=2)),
                ('component_position', models.CharField(choices=[('be', 'Below (full width)'), ('ri', 'Right (half width)'), ('le', 'Left (half width)')], max_length=2)),
            ],
        ),
        migrations.CreateModel(
            name='AboutComponent',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('heading', models.CharField(max_length=50)),
                ('icon', models.CharField(max_length=20)),
                ('text', models.TextField()),
                ('section', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='components', to='supermanzer.aboutsection')),
            ],
        ),
    ]
