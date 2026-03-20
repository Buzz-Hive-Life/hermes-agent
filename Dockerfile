# Use standard Python 3.11
FROM python:3.11-slim

# Set work directory
WORKDIR /app

# Install base system tools
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy your code into the container
COPY . /app/

# Install the Python requirements
RUN pip install --no-cache-dir .

# Force the installation of the headless browser AND all its required system dependencies
RUN playwright install --with-deps chromium

# Wake Buzz up
CMD ["hermes", "gateway"]
