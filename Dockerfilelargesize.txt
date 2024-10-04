FROM python:3.12-slim as builder
COPY project1.tar .
RUN tar -xvf project1.tar
COPY requirements.txt /crm_project

# Set the working directory
WORKDIR /crm_project

# Install dependencies
RUN pip install -r requirements.txt

# Command to run the server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
