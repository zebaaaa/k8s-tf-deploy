pipeline {
    agent any

    environment {
        AWS_REGION = "ap-south-1"
        ECR_REPO = "329668418627.dkr.ecr.ap-south-1.amazonaws.com/musicwebapp-dev"
        IMAGE_TAG = "${BUILD_NUMBER}"
        KUBE_DEPLOYMENT = "musicapp"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/zebaaaa/k8s-tf-deploy.git'
            }
        }

        stage('Docker Build') {
            steps {
                sh """
                docker build -t $ECR_REPO:$IMAGE_TAG .
                """
            }
        }

        stage('Login to ECR') {
            steps {
                sh """
                aws ecr get-login-password --region $AWS_REGION \
                | docker login --username AWS --password-stdin $ECR_REPO
                """
            }
        }

        stage('Push Image to ECR') {
            steps {
                sh """
                docker push $ECR_REPO:$IMAGE_TAG
                """
            }
        }

        stage('Deploy to EKS') {
            steps {
                sh """
                kubectl set image deployment/$KUBE_DEPLOYMENT \
                $KUBE_DEPLOYMENT=$ECR_REPO:$IMAGE_TAG
                """
            }
        }
    }

    post {
        success {
            echo "✅ Deployment Successful!"
        }
        failure {
            echo "❌ Deployment Failed!"
        }
    }
}
