#!/bin/bash

# This script builds a Docker image and publishes it to a given repository in the AWS ECR service
set -e
ECR_URL_BASE=109653375423.dkr.ecr.eu-west-1.amazonaws.com
SERVICE_NAME=aws-compliance
REGION=eu-west-1
REPOSITORY_URI=$ECR_URL_BASE/$SERVICE_NAME
docker build -t $REPOSITORY_URI:latest .
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ECR_URL_BASE
docker push $REPOSITORY_URI:latest
