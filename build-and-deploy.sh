#!/bin/bash
echo "Building Docker image..."
docker build -t react-pipeline .

echo "Saving Docker image to tar file..."
docker save react-pipeline -o react-pipeline.tar

echo "Copying image to EC2..."
scp -o StrictHostKeyChecking=no -i /c/Users/Aqsa/Downloads/mykeypair.pem react-pipeline.tar ec2-user@13.219.203.147:/home/ec2-user/

echo "Loading image on EC2 and running it..."
ssh -o StrictHostKeyChecking=no -i /c/Users/Aqsa/Downloads/mykeypair.pem ec2-user@13.219.203.147 \
    "docker load -i react-pipeline.tar && docker run -d -p 80:3000 react-pipeline"
