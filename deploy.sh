#!/bin/bash

# Stop any existing containers
docker stop app || true
docker rm app || true

# Pull the latest image from Docker Hub
docker pull sanjeevbalanb/prod:latest

# Run the container
docker run -d -p 80:80 --name app sanjeevbalanb/prod:latest
