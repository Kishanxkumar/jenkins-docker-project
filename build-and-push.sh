#!/bin/bash

set -e

IMAGE_NAME="kishan272/jenkins-docker-project"
IMAGE_TAG="${BUILD_NUMBER:-1}"

echo "Building Docker image..."
docker build -t "$IMAGE_NAME:$IMAGE_TAG" .

echo "Tagging image as latest..."
docker tag "$IMAGE_NAME:$IMAGE_TAG" "$IMAGE_NAME:latest"

echo "Logging in to Docker Hub..."
echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

echo "Pushing image..."
docker push "$IMAGE_NAME:$IMAGE_TAG"

echo "Pushing latest tag..."
docker push "$IMAGE_NAME:latest"

docker logout

echo "Docker image pushed successfully!"
echo "Image: $IMAGE_NAME:$IMAGE_TAG"
