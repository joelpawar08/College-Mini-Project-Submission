# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set environment variables to ensure correct installation
ENV PYTHONUNBUFFERED 1

# Install SDL2 dependencies
RUN apt-get update && apt-get install -y \
    libsdl2-dev \
    libsdl2-image-dev \
    libsdl2-mixer-dev \
    libsdl2-ttf-dev \
    libsmpeg0 \
    libportmidi-dev \
    libfreetype6-dev \
    pkg-config

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app/

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define the command to run your app using Gunicorn or another server
CMD ["python", "app.py"]
