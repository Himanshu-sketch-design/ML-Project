# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install AWS CLI using apt-get
RUN apt-get update && apt-get install -y awscli

# Install build dependencies
RUN apt-get install -y build-essential python3-dev libffi-dev

# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME=World

# Run app.py when the container launches
CMD ["python3", "app.py"]