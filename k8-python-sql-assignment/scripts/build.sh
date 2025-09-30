#!/bin/bash

# Build Docker image
docker build -f /c/devops/devmumbai/kubernetes/DM-yaml-practice/k8-python-sql-assignment/python-app/Dockerfile \
-t honey120ar/python-flask-app \
/c/devops/devmumbai/kubernetes/DM-yaml-practice/k8-python-sql-assignment/python-app/

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "Docker image built successfully."

    # Docker login
    docker login
    if [ $? -eq 0 ]; then
        echo "Docker login successful."

        # Push the image
        docker push honey120ar/python-flask-app
        if [ $? -eq 0 ]; then
            echo "Docker image pushed successfully."
        else
            echo "Docker push failed."
            exit 1
        fi
    else
        echo "Docker login failed."
        exit 1
    fi
else
    echo "Docker build failed."
    exit 1
fi
