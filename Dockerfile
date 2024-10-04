# Stage 1: Builder
FROM python:3.12-slim as builder

# Set environment variables to avoid Python buffering
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /crm_project

# Copy the requirements file first for better caching
COPY requirements.txt .

# Install system dependencies (if needed)
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the tar file and extract it
COPY project1.tar .
RUN tar -xvf project1.tar --strip-components=1 && rm project1.tar

# Stage 2: Final image
FROM python:3.12-alpine

# Set environment variables to avoid Python buffering
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /crm_project

# Copy only the necessary files from the builder stage
COPY --from=builder /crm_project /crm_project

# Ensure dependencies are available in the final image
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages

# Install any additional dependencies needed for Alpine
RUN apk add --no-cache \
    libmagic \
    && rm -rf /var/cache/apk/*

# Create a non-root user and switch to it
RUN adduser -D appuser
USER appuser

# Command to run the server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
