FROM python:3.11-slim

# Set working directory
WORKDIR /app

# ✅ Install netcat and system dependencies
RUN apt-get update && apt-get install -y netcat-openbsd

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Copy and set entrypoint script
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Run entrypoint, then start the app
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["gunicorn", "LittleLemon.wsgi:application", "--bind", "0.0.0.0:8000"]
