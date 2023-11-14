pipeline {
    agent any

    environment {
        GITHUB_CREDENTIALS = credentials('git')
        DOCKER_TOKEN = credentials('docker')
        DOCKER_REPO_DEV = 'jenishan1611/dev-repo'
        DOCKER_REPO_PROD = 'jenishan1611/prod-repo'
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
                    withCredentials([usernamePassword(credentialsId: 'git', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD'),
                                     string(credentialsId: 'docker-access-token', variable: 'DOCKER_TOKEN')]) {
                        
                        // Build Docker image and tag it based on the branch
                        def branchName = sh(script: 'git rev-parse --abbrev-ref HEAD', returnStdout: true).trim()
                        def dockerRepo = branchName == 'dev' ? DOCKER_REPO_DEV : DOCKER_REPO_PROD
                        def imageName = "${dockerRepo}:${branchName.toLowerCase()}"

                        sh "./build.sh"

                        // Log in to Docker Hub
                        withDockerRegistry([credentialsId: 'docker', url: 'https://index.docker.io/v1/']) {
                            // Tag and push the Docker image
                            //docker.image(imageName).withTag(branchName.toLowerCase()).push()
                            sh "./deploy.sh"
                        }

                        // Deploy using the deploy.sh script
                        
                    }
                }
            }
        }
    }
}
