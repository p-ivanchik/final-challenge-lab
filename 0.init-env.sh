#!/usr/bin/env bash

git config --global user.email "${account}"
git config --global user.name "User Name"

#ssh-keygen -b 2048 -t rsa -f ./keys/rsa_key -q -N ''
#eval `ssh-agent`
#ssh-add ./keys/rsa_key
echo
cat ~/.ssh/id_rsa.pub
echo
echo "Register key with: https://source.cloud.google.com/user/ssh_keys"

echo "Enabling apis"
gcloud services enable \
  sourcerepo.googleapis.com \
  compute.googleapis.com \
  artifactregistry.googleapis.com \
  container.googleapis.com

gcloud auth configure-docker ${LOCATION}-docker.pkg.dev
