#!/bin/bash

DOCKER_USERNAME="jenishan1611"

# Print the current working directory for debugging
echo "Current Working Directory: $(pwd)"

# Get the current branch name
BRANCH_NAME=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD)

# Print the branch name for debugging
echo "Branch: $BRANCH_NAME"

if [[ $BRANCH_NAME == "dev" ]]; then
    # ./build.sh  # Uncomment this line if you want to build the Docker image
    docker login --username $DOCKER_USERNAME --password $DOCKER_TOKEN
    if [ $? -eq 0 ]; then
        echo "Docker login successful from dev."

        IMAGE_NAME="reactimg"

        # Tag and push the Docker image for the 'dev' branch
        docker tag $IMAGE_NAME $DOCKER_USERNAME/dev
        docker push $DOCKER_USERNAME/dev

        if [ $? -eq 0 ]; then
            echo "Docker image pushed successfully to Docker Hub for 'dev' branch."
        else
            echo "Failed to push Docker image to Docker Hub for 'dev' branch."
        fi
    else
        echo "Failed to log in to Docker Hub."
    fi
elif [[ $BRANCH_NAME == "master" ]]; then
    # ./build.sh  # Uncomment this line if you want to build the Docker image
    docker login --username $DOCKER_USERNAME --password $DOCKER_TOKEN
    if [ $? -eq 0 ]; then
        echo "Docker login successful from master."

        IMAGE_NAME="reactimg"

        # Tag and push the Docker image for the 'master' branch
        docker tag $IMAGE_NAME $DOCKER_USERNAME/prod:latest
        docker push $DOCKER_USERNAME/prod:latest

        if [ $? -eq 0 ]; then
            echo "Docker image pushed successfully to Docker Hub for 'master' branch."
        else
            echo "Failed to push Docker image to Docker Hub for 'master' branch."
        fi
    else
        echo "Failed to log in to Docker Hub."
    fi
else
    echo "Successfully pushed."
fi
