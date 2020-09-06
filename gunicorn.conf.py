# GUNICORN CONFIGURATION FILE
import os

# WSGI Application
wsgi_app = "api.wsgi"

# Address to bind to
bind = os.getenv('DJANGO_HOST') + ":8000"

# Number of independent worker processes to repsond to requests
workers = 4
