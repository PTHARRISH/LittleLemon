FROM python:3.11

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

# Collect static files (optional)
RUN python manage.py collectstatic --noinput

# 🛠 Run migrations and custom command
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
# Start the app with Gunicorn
CMD ["gunicorn", "LittleLemon.wsgi:application", "--bind", "0.0.0.0:8000"]
