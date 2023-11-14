pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker')
        GITHUB_CREDENTIALS = credentials('git')
    }

    options {
        skipDefaultCheckout()
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout code from the repository using GitHub credentials
                    checkout([$class: 'GitSCM', branches: [[name: '*/dev']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CheckoutOption', timeout: 60], [$class: 'CloneOption', noTags: true, reference: '', shallow: true]], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/jenishan1611/capstone.git']]])
                }
            }
        }

        stage('Build and Push to Dev') {
            when {
                expression { env.BRANCH_NAME == 'dev' }
            }
            steps {
                script {
                    // Build and push Docker image to the Dev repository on Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                        sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
                        sh 'docker build -t ${devimg} .'
                        sh 'docker push ${devimg}'
                    }
                }
            }
        }

        stage('Build and Push to Prod') {
            when {
                expression { env.BRANCH_NAME == 'master' }
            }
            steps {
                script {
                    // Build and push Docker image to the Prod repository on Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                        sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
                        sh 'docker build -t ${prodimg} .'
                        sh 'docker push ${prodimg}'
                    }
                }
            }
        }
    }
}
