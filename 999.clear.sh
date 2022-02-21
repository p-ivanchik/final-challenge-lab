#!/usr/bin/env bash


gcloud beta builds triggers delete "${TRIGGER_NAME}"
gcloud source repos delete ${REPO_NAME} --quiet
gcloud artifacts repositories delete ${REPO_NAME} --quiet