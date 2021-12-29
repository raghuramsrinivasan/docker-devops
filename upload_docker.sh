#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=sraghuraman27/udacity-devopsapi

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
winpty docker login -u sraghuraman27
winpty docker tag devopsapi $dockerpath

# Step 3:
# Push image to a docker repository
echo "Docker ID and Image pushing to docker hub: $dockerpath"
winpty docker push $dockerpath

cmd /k