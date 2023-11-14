#!/bin/bash

# Stop and remove existing containers (if any)
docker-compose down  || true

# Build the Docker image
docker build -t reactimg .

# Start the containers in detached mode
docker-compose up -d
