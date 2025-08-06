#!/bin/bash
cd /home/ec2-user/deploy

# Stop and remove old container if running
docker stop react-container || true
docker rm react-container || true

# Build and run new container
docker build -t react-pipeline .
docker run -d --name react-container -p 80:3000 react-pipeline
