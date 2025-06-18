FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install required system packages
RUN apt-get update && apt-get install -y netcat-openbsd

# Copy dependencies and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all source code
COPY . .

# Set environment variables (optional for timezone, etc.)
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Default command to run migrations + start server
CMD sh -c "
  echo '🔁 Waiting for database...' &&
  until nc -z \$DB_HOST \$DB_PORT; do sleep 1; done &&
  echo '✅ Database ready!' &&
  python manage.py migrate --noinput &&
  python manage.py collectstatic --noinput &&
  python manage.py create_superuser || true &&
  gunicorn LittleLemon.wsgi:application --bind 0.0.0.0:8000"
