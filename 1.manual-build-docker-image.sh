#!/usr/bin/env bash

# 1. Manual Build Docker Image (10 points):
#	Create a Cloud Source Repository with your app (HTTP Server).
gcloud source repos create ${REPO_NAME} --quiet

gcloud source repos list --filter="name ~ ${REPO_NAME}"

#	Add a Dockerfile file into your repository to build your app.
docker build -t ${LOCAL_IMAGE} .

#	Test the created Docker image.

# Push the Docker image into the Artifact Repository.
gcloud config set artifacts/location ${LOCATION}
gcloud artifacts repositories create ${REPO_NAME} --repository-format=Docker


docker tag ${LOCAL_IMAGE} ${GCP_IMAGE}
docker push ${GCP_IMAGE}


