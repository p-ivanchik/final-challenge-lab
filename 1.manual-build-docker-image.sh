. project-vars.sh

# 1. Manual Build Docker Image (10 points):
#	Create a Cloud Source Repository with your app (HTTP Server).
gcloud source repos create ${REPO_NAME}
git remote add google ssh://${USER_ID}@source.developers.google.com:2022/p/${project}/r/${REPO_NAME}

LOCAL_IMAGE=${REPO_NAME}
GCP_IMAGE=${LOCATION}-docker.pkg.dev/${project}/${REPO_NAME}/${REPO_NAME}

#	Add a Dockerfile file into your repository to build your app.
#	Test the created Docker image.
docker build -t ${LOCAL_IMAGE} .

# Push the Docker image into the Artifact Repository.
gcloud config set artifacts/location ${LOCATION}
gcloud artifacts repositories create ${REPO_NAME} --repository-format=Docker
gcloud auth configure-docker ${LOCATION}-docker.pkg.dev

docker tag ${LOCAL_IMAGE} ${GCP_IMAGE}

docker push ${GCP_IMAGE}
