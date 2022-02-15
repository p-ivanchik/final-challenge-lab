#!/usr/bin/env bash

. project-vars.sh

git config --global user.email "${account}"
git config --global user.name "User Name"
git remote add google ssh://${USER_ID}@source.developers.google.com:2022/p/${project}/r/${REPO_NAME}