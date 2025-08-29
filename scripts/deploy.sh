#!/bin/bash

# Stop any running containers of this image
sudo docker stop $(sudo docker ps -q --filter ancestor=myapp:latest) || true
sudo docker rm $(sudo docker ps -a -q --filter ancestor=myapp:latest) || true

# Build the Docker image
sudo docker build -t myapp:latest ~/myapp-repo

# Run the container on port 8080
sudo docker run -d -p 8080:80 myapp:latest

