ECR_URL_BASE=109653375423.dkr.ecr.eu-west-1.amazonaws.com
SERVICE_NAME=aws-compliance
REPOSITORY_URI=$ECR_URL_BASE/$SERVICE_NAME
docker build -t $REPOSITORY_URI:latest .
aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin $ECR_URL_BASE
docker push $REPOSITORY_URI:latest
