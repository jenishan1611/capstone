pipeline {
    agent any

    environment {
        GITHUB_CREDENTIALS = credentials('git')
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    
                    checkout([$class: 'GitSCM', branches: [[name: '*/dev']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CheckoutOption', timeout: 60], [$class: 'CloneOption', noTags: true, reference: '', shallow: true]], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/jenishan1611/capstone.git']]])
                }
            }
        }

        stage('Build and Push') {
            steps {
                script {
                    
                    
                    withCredentials([usernamePassword(credentialsId: 'git', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) {
                        withCredentials([string(credentialsId: 'docker', variable: 'DOCKER_TOKEN')]) {                 
                        sh './build.sh'
                        sh './deploy.sh'
                    }
                    }
                }
            }
        }
    }
}
