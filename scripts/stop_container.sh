#!/bin/bash
set -e
sudo docker stop myapp || true
sudo docker rm myapp || true
