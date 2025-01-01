#!/bin/bash

# Build the Docker image
docker build -t sanjeevbalanb/dev:latest .

# Tag the image with a version (optional)
docker tag sanjeevbalanb/dev:latest sanjeevbalanb/prod:latest
