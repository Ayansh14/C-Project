pipeline {
    agent {
        label 'your-agent'
        retries 2   // retry agent allocation if non-resumable
    }
    stages {
        stage('Checkout') {
            steps {
                // Wrap git in retry to handle non-resumable error
                retry(2) {
                    git branch: 'main', url: 'https://github.com/Ayansh14/C-Project.git'
                }
            }
        }
        stage('Build') {
            steps {
                sh 'make'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t myimage .'
            }
        }
        stage('Push to ECR') {
            steps {
                sh 'docker push 146727531327.dkr.ecr.ap-south-1.amazonaws.com/testproject'
            }
        }
    }
}

             
        
