pipeline {
    agent any

    environment {
        GITHUB_CREDENTIALS = credentials('git')
        //DOCKER_TOKEN = credentials('docker')
        DOCKER_CREDENTIALS = credentials('docker')
        DOCKER_USERNAME='jenishan1611'
        DOCKER_REPO_DEV = 'jenishan1611/dev'
        DOCKER_REPO_PROD = 'jenishan1611/prod'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scm
                }
            }
        }

        stage('Build and Push') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'git', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) {
                        
                        // Build Docker image and tag it based on the branch
                        def branchName = sh(script: 'git rev-parse --abbrev-ref HEAD', returnStdout: true).trim()
                        //def dockerRepo = branchName == 'dev' ? DOCKER_REPO_DEV : DOCKER_REPO_PROD
                        //def imageName = "${dockerRepo}:${branchName.toLowerCase()}"

                        //sh "./build.sh"
                        //sh "./deploy.sh"

                //         // Log in to Docker Hub
                //     withDockerRegistry([credentialsId: 'docker', url: 'https://index.docker.io/v1/']) {
                //      echo "Docker login successful."

                //     // Tag and push the Docker image
                //     echo "Tagging Docker image: ${imageName}"
                //     docker.image(imageName).push("--tag=${branchName.toLowerCase()}")

                //     echo "Pushing Docker image: ${imageName}"
                //     docker.image(imageName).push()
                // }
                    //     withCredentials([string(credentialsId: 'docker', variable: 'DOCKER_TOKEN')]) {
                    //     def loginCmd = "docker login -u ${DOCKER_USERNAME} -p \${DOCKER_TOKEN}"
                    //     def loginStatus = sh(script: loginCmd, returnStatus: true)
                        
                    //     if (loginStatus == 0) {
                    //         echo "Docker login successful."
                    //     } else {
                    //         error "Failed to log in to Docker Hub."
                    //     }
                    // }
                    withCredentials([string(credentialsId: 'docker', variable: 'DOCKER_TOKEN')]) {
                            def loginCmd = "docker login -u ${DOCKER_USERNAME} -p \${DOCKER_TOKEN}"
                        def loginStatus = sh(script: loginCmd, returnStatus: true)
                        
                        if (loginStatus == 0) {
                            echo "Docker login successful."
                        } else {
                            error "Failed to log in to Docker Hub."
                        }
                        }

                        
                    }
                }
            }
        }
    }
}
