pipeline {
    agent any

    environment {
       
        GITHUB_CREDENTIALS = credentials('git')
    

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout code from the repository using GitHub credentials
                    checkout([$class: 'GitSCM', branches: [[name: '*/dev']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CheckoutOption', timeout: 60], [$class: 'CloneOption', noTags: true, reference: '', shallow: true]], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/jenishan1611/capstone.git']]])
                }
            }
        }

        stage('Build and Push') {
            
            steps {
                script {
                  
                        sh './build.sh'
                        sh './deploy.sh'
                        
                    }
                }
            }
        }

        
    }
}
