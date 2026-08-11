```dockerfile
FROM python:3.12-slim

# Prevent Python from creating .pyc files and buffer stdout/stderr
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Install Python dependencies first for better Docker layer caching
COPY movie_catelogue/requirements.txt ./requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

# Copy the application
COPY movie_catelogue/ ./

# Persistent application data
RUN mkdir -p /data

EXPOSE 5000

CMD ["python", "app.py"]
```
