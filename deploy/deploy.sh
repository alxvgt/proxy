#!/usr/bin/env bash
set -x

source proxy/.deploy.env
mkdir -p ~/.ssh
ssh-keyscan -t rsa github.com > ~/.ssh/known_hosts
test -d ${SERVER_APP_PATH} && (cd ${SERVER_APP_PATH} && git checkout master && git reset --hard origin/master && git pull) || git clone git@github.com:alxvgt/supervision.git ${SERVER_APP_PATH}
cat proxy/.deploy.env > ${SERVER_APP_PATH}/.env
cd ${SERVER_APP_PATH}
bash docker/start.sh