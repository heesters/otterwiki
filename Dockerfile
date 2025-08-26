FROM python:3.11-slim

# Install dependencies
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy otterwiki source
COPY data/config.yaml /data/config.yaml

# Use persistent storage for wiki data
ENV OTTERWIKI_STORAGE_PATH=/data
ENV OTTERWIKI_CONFIG=/data/config.yaml

# Render passes $PORT automatically
CMD ["python", "run.py", "--host", "0.0.0.0", "--port", "${PORT}"]
