#!/usr/bin/env bash



#3. Manual Docker Image Deployment (10 points):
gcloud config set compute/zone ${LOCATION}-b
gcloud container clusters create ${REPO_NAME}-cluster --num-nodes 2 --scopes "https://www.googleapis.com/auth/projecthosting,storage-rw"
gcloud container clusters get-credentials ${REPO_NAME}-cluster
#	Use the image to create and expose a deployment in Kubernetes.
cat << END |kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ${REPO_NAME}
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ${REPO_NAME}
  template:
    metadata:
      labels:
        app: ${REPO_NAME}
    spec:
      containers:
        - name: flask
          image: "${GCP_IMAGE}:abc"
          ports:
            - name: http
              containerPort: ${CONTAINER_PORT}
END

kubectl expose deployment ${REPO_NAME} --port ${CONTAINER_PORT} --type LoadBalancer

EXTERNAL_IP=`kubectl get services ${REPO_NAME} -o json|jq -r '.status.loadBalancer.ingress[].ip'`
curl http://${EXTERNAL_IP}:${CONTAINER_PORT}
