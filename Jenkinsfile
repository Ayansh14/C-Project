pipeline {
    agent any
    environment {
        AWS_REGION = "ap-south-1"
        ECR_REPO = "146727531327.dkr.ecr.ap-south-1.amazonaws.com/testproject"
        IMAGE_TAG = "latest"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Ayansh14/C-Project.git'
            }
        }
        stage('Login to ECR') {
            steps {
                sh '''
                aws ecr get-login-password --region $AWS_REGION \
                | docker login --username AWS --password-stdin $ECR_REPO
                '''
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $ECR_REPO:$IMAGE_TAG .'
            }
        }
        stage('Push to ECR') {
            steps {
                sh 'docker push $ECR_REPO:$IMAGE_TAG'
            }
        }
    }
}
