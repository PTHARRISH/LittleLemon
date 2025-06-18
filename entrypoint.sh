#!/bin/sh

echo "Waiting for database..."

# Replace these with your actual DB host/port
while ! nc -z $DB_HOST $DB_PORT; do
  sleep 1
done

echo "Database is up!"

python manage.py migrate
python manage.py collectstatic --noinput
python manage.py createsuperuser --noinput || true

exec "$@"
