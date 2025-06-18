FROM python:3.11

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

# Collect static files (optional)
RUN python manage.py collectstatic --noinput

# 🛠 Run migrations and custom command
RUN python manage.py migrate
RUN python manage.py create_superuser

# Start the app with Gunicorn
CMD ["gunicorn", "LittleLemon.wsgi:application", "--bind", "0.0.0.0:8000"]
