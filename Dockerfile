FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y netcat

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your app code
COPY . .

# Copy and make the entrypoint script executable
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Run entrypoint and then the app
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["gunicorn", "LittleLemon.wsgi:application", "--bind", "0.0.0.0:8000"]
