pipeline {
    agent { label 'docker-node' }

    stages {
        stage('Checkout') {
            steps {
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
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',
                                  credentialsId: 'aws-creds']]) {
                    sh '''
                    aws ecr get-login-password --region ap-south-1 | \
                    docker login --username AWS --password-stdin 146727531327.dkr.ecr.ap-south-1.amazonaws.com
                    docker tag myimage:latest 146727531327.dkr.ecr.ap-south-1.amazonaws.com/testproject:latest
                    docker push 146727531327.dkr.ecr.ap-south-1.amazonaws.com/testproject:latest
                    '''
                }
            }
        }
    }

    post {
        success { echo "Build and push succeeded!" }
        failure { echo "Pipeline failed — check logs." }
    }
}
