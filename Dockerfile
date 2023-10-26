# Use the official Ubuntu image as the base image
FROM ubuntu:20.04

# Update and install necessary packages
RUN apt-get update -y && apt-get install -y python3 python3-pip

# Set the working directory inside the container
WORKDIR /app

# Copy your Python script to the container
#COPY generate_project.py /app/

#copy all files in directory called dockerfiles to the container
COPY ./dockerfiles /app/

# Create a volume to share files between the container and your local machine
VOLUME ["/app"]