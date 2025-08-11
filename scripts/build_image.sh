#!/bin/bash
set -e
cd /home/ubuntu/myapp
sudo docker build -t myapp:latest .
