# Generated by Django 3.1.1 on 2020-09-04 21:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('supermanzer', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='projectsection',
            name='heading',
            field=models.CharField(blank=True, max_length=100),
        ),
    ]
