#!/usr/bin/env bash


#5. Connect to Database using Cloud SQL Auth Proxy (10 points):
#	Create a Cloud SQL Database with a private IP address.
#gcloud sql tiers list
gcloud sql instances create ${DB_INSTANCE_NAME} \
--tier=db-f1-micro  \
--region=${LOCATION}
Generate k8s secrets for db access


#Connect to Database using Cloud SQL Auth Proxy.
#Download the Cloud SQL Auth proxy:
curl -o cloud_sql_proxy https://dl.google.com/cloudsql/cloud_sql_proxy.darwin.amd64
gcloud iam service-accounts create SERVICE_ACCOUNT_${REPO_NAME} \
    --description="DESCRIPTION: ${REPO_NAME}" \
    --display-name="DISPLAY_NAME: ${REPO_NAME}

- To grant service account an IAM role on the project
- Generate key for service account
- Generate k8s secrets for service account

