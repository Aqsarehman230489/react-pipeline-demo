#!/bin/bash
cd /home/ec2-user/deploy
docker stop react-container || true
docker rm react-container || true
docker build -t react-pipeline .
docker run -d --name react-container -p 80:3000 react-pipeline
