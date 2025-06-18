# Use official Python 3.11 image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy your code to the container
COPY . .

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Expose port (optional, depending on your app)
EXPOSE 8000

# Command to run your Django app (customize if needed)
CMD ["gunicorn", "LittleLemon.wsgi:application", "--bind", "0.0.0.0:8000"]
