# Use Ubuntu 22.04 as base image
FROM ubuntu:22.04

# Set environment variables to prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update system and install required dependencies
RUN apt-get update && apt-get install -y \
    docker.io \
    docker-compose \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Copy the win10.yml file to the container
COPY win10.yml /root/win10.yml

# Expose the necessary ports
EXPOSE 8006

# Start Docker service and run the container using docker-compose
CMD service docker start && docker-compose -f /root/win10.yml up
