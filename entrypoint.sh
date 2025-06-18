#!/bin/sh

# Wait for the database to be ready
echo "Waiting for database..."
while ! nc -z $DB_HOST $DB_PORT; do
  sleep 1
done

# Run migrations
echo "Running migrations..."
python manage.py migrate

# Create superuser if it doesn't exist (optional logic)
echo "Creating superuser..."
python manage.py create_superuser || true

# Start the server
echo "Starting app..."
exec "$@"
