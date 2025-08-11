#!/bin/bash
set -e
sudo docker run -d --name myapp -p 80:80 myapp:latest
