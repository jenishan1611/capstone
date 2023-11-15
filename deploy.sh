#!/bin/bash

DOCKER_USERNAME="jenishan1611"

if [[ $BRANCH_NAME == "dev" ]]; then
    ./build.sh
    docker login --username $DOCKER_USERNAME --password $DOCKER_TOKEN
    if [ $? -eq 0 ]; then
        echo "Docker login successful from dev."

        IMAGE_NAME="reactimg"

        # Tag and push the Docker image for the 'dev' branch
        docker tag $IMAGE_NAME $DOCKER_USERNAME/$IMAGE_NAME:dev
        docker push $DOCKER_USERNAME/$IMAGE_NAME:dev

        if [ $? -eq 0 ]; then
            echo "Docker image pushed successfully to Docker Hub for 'dev' branch."
        else
            echo "Failed to push Docker image to Docker Hub for 'dev' branch."
        fi
    else
        echo "Failed to log in to Docker Hub."
    fi
elif [[ $BRANCH_NAME == "master" ]]; then
    ./build.sh
    docker login --username $DOCKER_USERNAME --password $DOCKER_TOKEN
    if [ $? -eq 0 ]; then
        echo "Docker login successful from master."

        IMAGE_NAME="reactimg"

        # Tag and push the Docker image for the 'master' branch
        docker tag $IMAGE_NAME $DOCKER_USERNAME/$IMAGE_NAME:latest
        docker push $DOCKER_USERNAME/$IMAGE_NAME:latest

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
