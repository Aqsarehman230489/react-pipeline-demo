#!/bin/bash
cd /home/ec2-user/deploy

# Stop and remove old container if running
docker stop react-container || true
docker rm react-container || true

# Load the Docker image
docker load -i react-pipeline.tar

# Run new container
docker run -d --name react-container -p 80:3000 react-pipeline
