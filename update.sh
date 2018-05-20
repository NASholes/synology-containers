#!/bin/bash

INSTALL_PATH=$(dirname "${BASH_SOURCE[0]}")

if [ "$#" -ne 1 ]; then
  echo "Error: not enough arguments provided"
  echo ""
  echo "Usage: $0 SERVICE"
  echo ""
  echo "You can find available services in $INSTALL_PATH/svc"
  exit 1
fi

INSTALL_PATH=$(dirname "${BASH_SOURCE[0]}")

CONTAINER_NAME=$1

source $INSTALL_PATH/env.sh
source $INSTALL_PATH/svc/$CONTAINER_NAME.sh

sudo docker stop $NAME
sudo docker rm $NAME
sudo docker pull $IMAGE
sudo docker image prune -f
sudo docker volume prune -f

run
