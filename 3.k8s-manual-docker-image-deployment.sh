#!/usr/bin/env bash



#3. Manual Docker Image Deployment (10 points):
gcloud config set compute/zone ${LOCATION}-b
gcloud container clusters create ${REPO_NAME}-cluster --num-nodes 2 --scopes "https://www.googleapis.com/auth/projecthosting,storage-rw"

#	Use the image to create and expose a deployment in Kubernetes.
kubectl create deployment   ${REPO_NAME} --image=${GCP_IMAGE}
kubectl expose deployment ${REPO_NAME} --port 80 --type LoadBalancer

kubectl get services
curl http://<External IP>:80
#	Update the image and push a change to the deployment.