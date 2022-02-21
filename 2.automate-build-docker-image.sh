#!/usr/bin/env bash

# Create in GCP console then export config as template
# gcloud beta builds triggers list --filter="name=<trigger-name>" >trigger.yaml.tpl
# sed -e "s|<IMAGE>|${GCP_IMAGE}|; s|<TRIGGER_NAME>|hhh|; s|<PROJECT_ID>|${project}|; s|<REPO_NAME>|${REPO_NAME}|"  zz

#2. Automate Build Docker Image (10 points):
#	Create a pipeline in Cloud Build to build a Docker image when the source code changes.

TRIGGER_NAME=trigger-${REPO_NAME}
TRIGGER_CONFIG_NAME="/tmp/trigger-${REPO_NAME}.yaml"

cat<<END > ${TRIGGER_CONFIG_NAME}
---
build:
  images:
  - ${GCP_IMAGE}:\$COMMIT_SHA
  options: {}
  steps:
  - args:
    - build
    - -t
    - ${GCP_IMAGE}:\$COMMIT_SHA
    - .
    name: gcr.io/cloud-builders/docker
name:
  ${TRIGGER_NAME}
triggerTemplate:
  branchName: .*master
  projectId: ${project}
  repoName: ${REPO_NAME}
END


gcloud beta builds triggers create cloud-source-repositories --trigger-config=${TRIGGER_CONFIG_NAME}

gcloud beta builds triggers list --filter="name ~ ${TRIGGER_NAME}"

REPO=`gcloud source repos list --format=json --filter="name ~ ${REPO_NAME}"|jq  -r '.[]|.url'|sed 's|https://||; s|/p/|:2022/p/|'`
git remote remove google
git remote add google "ssh://${account}@${REPO}"


sed -i -e "s|<date>|`date`|" app.py
git add app.py
git commit -m "Updated `date`"
git push google master
