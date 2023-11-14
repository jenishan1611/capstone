#!/bin/bash

DOCKER_USERNAME="jenishan1611"
DOCKER_TOKEN="dckr_pat_VluWhuCgoR1TsUUv62jDHflfxv8"

if [[ $GIT_BRANCH == origin/dev]] ; then
    ./build.sh
    docker login --username $DOCKER_USERNAME --password $DOCKER_TOKEN
    if [ $? -eq 0 ]; then
        echo "Docker login successful."

        IMAGE_NAME="reactimg"

        docker tag $IMAGE_NAME $DOCKER_USERNAME/$IMAGE_NAME

        docker push $DOCKER_USERNAME/$IMAGE_NAME

        if [ $? -eq 0 ]; then
            echo "Docker image pushed successfully to Docker Hub."
        else
            echo "Failed to push Docker image to Docker Hub."
        fi
    else
        echo "Failed to log in to Docker Hub."
    fi
else if [[ $GIT_BRANCH == origin/master ]] ; then
    ./build.sh
    docker login --username $DOCKER_USERNAME --password $DOCKER_TOKEN
    if [ $? -eq 0 ]; then
        echo "Docker login successful."

        IMAGE_NAME="reactimg"

        docker tag $IMAGE_NAME $DOCKER_USERNAME/$IMAGE_NAME

        docker push $DOCKER_USERNAME/$IMAGE_NAME

        if [ $? -eq 0 ]; then
            echo "Docker image pushed successfully to Docker Hub."
        else
            echo "Failed to push Docker image to Docker Hub."
        fi
    else
        echo "Failed to log in to Docker Hub."
    fi
else
    echo "successfully pushed"
