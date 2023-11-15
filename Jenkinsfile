pipeline {
    agent any

    environment {
        GITHUB_CREDENTIALS = credentials('git')
        //DOCKER_TOKEN = credentials('docker')
        DOCKER_CREDENTIALS = credentials('DOCKER_TOKEN')
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
                    //withCredentials([usernamePassword(credentialsId: 'git', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) {
                        
                        
                      //  def branchName = sh(script: 'git rev-parse --abbrev-ref HEAD', returnStdout: true).trim()
                        //def dockerRepo = branchName == 'dev' ? DOCKER_REPO_DEV : DOCKER_REPO_PROD
                        //def imageName = "${dockerRepo}:${branchName.toLowerCase()}"            
                     withCredentials([usernamePassword(credentialsId: 'git', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD'),
                                     string(credentialsId: 'DOCKER_TOKEN', variable: 'DOCKER_TOKEN')]) {

                        
                        def loginCmd = "docker login -u ${DOCKER_USERNAME} -p \${DOCKER_TOKEN}"
                        def loginStatus = sh(script: loginCmd, returnStatus: true)

                        if (loginStatus == 0) {
                            echo "Docker login successful."
                        } else {
                            error "Failed to log in to Docker Hub."
                        }

                        sh './deploy.sh'
                    }
                }
            }
        }
    }
}
