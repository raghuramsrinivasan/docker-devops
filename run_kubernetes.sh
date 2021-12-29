#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=sraghuraman27/udacity-devopsapi
# Step 2
# Run the Docker Hub container with kubernetes
echo "Docker ID and Image: $dockerpath"
kubectl run devopsapi --image=$dockerpath --port=8000

# Step 3:
# List kubernetes pods
kubectl get pods
# Step 4:
# Forward the container port to a host
kubectl port-forward pods/devopsapi 8000:80

cmd /k
