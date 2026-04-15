pipeline {
    agent any

    environment {
        AWS_REGION = "ap-south-1"
        ECR_REPO = "134553439515.dkr.ecr.ap-south-1.amazonaws.com/devopskart"
    }

    stages {

        stage('Clone Code') {
            steps {
                git branch: 'main', url: '<your-github-repo-url>'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t devopskart:v2 ./docker'
                }
            }
        }

        stage('Login to ECR') {
            steps {
                script {
                    sh '''
                    aws ecr get-login-password --region $AWS_REGION \
                    | docker login --username AWS --password-stdin $ECR_REPO
                    '''
                }
            }
        }

        stage('Tag Image') {
            steps {
                sh 'docker tag devopskart:v1 $ECR_REPO:v1'
            }
        }

        stage('Push to ECR') {
            steps {
                sh 'docker push $ECR_REPO:v1'
            }
        }
    }
}
