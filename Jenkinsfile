pipeline {
    agent any

    environment {
        AWS_REGION = "ap-south-1"
        ECR_REPO = "134553439515.dkr.ecr.ap-south-1.amazonaws.com/devopskart"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devopskart:v2 ./docker'
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

        stage('Tag Image') {
            steps {
                sh 'docker tag devopskart:v2 $ECR_REPO:v2'
            }
        }

        stage('Push to ECR') {
            steps {
                sh 'docker push $ECR_REPO:v2'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                kubectl set image deployment/devopskart-deployment \
                devopskart-container=$ECR_REPO:v2
                '''
            }
        }
    }
}
