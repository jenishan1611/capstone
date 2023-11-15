#!/bin/bash

DOCKER_USERNAME="jenishan1611"

# Print the branch name for debugging
echo "Branch: $GIT_BRANCH"

if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # ./build.sh  
        IMAGE_NAME="reactimg"

        # Tag and push the Docker image for the 'dev' branch
        docker tag $IMAGE_NAME $DOCKER_USERNAME/dev
        docker push $DOCKER_USERNAME/dev

        if [ $? -eq 0 ]; then
            echo "Docker image pushed successfully to Docker Hub for 'dev' branch."
        else
            echo "Failed to push Docker image to Docker Hub for 'dev' branch."
        fi

elif [[ $GIT_BRANCH == "origin/master" ]]; then
    # ./build.sh 
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
    echo "Successfully pushed."
fi
