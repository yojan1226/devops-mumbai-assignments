#!/bin/bash

# Build the Docker image
docker build -t honey120ar/my-flask-app .

# Run the Docker container based on the image
docker run -d -p 5000:5000 honey120ar/my-flask-app

echo "Wait 20s for application up!"
sleep 20

# Verify result
curl localhost:5000
