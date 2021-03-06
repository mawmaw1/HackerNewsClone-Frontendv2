#!/bin/bash

BUILD_NUMBER=$1
DOCKER_ID=$2
# stop all running containers with our web application
docker stop `docker ps -a | grep ${DOCKER_ID}/hncfrontend | awk '{print substr ($0, 0, 12)}'`
# remove all of those containers
docker rm `docker ps -a | grep ${DOCKER_ID}/hncfrontend | awk '{print substr ($0, 0, 12)}'`
#if (( ${BUILD_NUMBER} >= 2 )); then
 #   # remove old image
  #  docker rmi ${DOCKER_ID}/hncfrontend:${BUILD_NUMBER}
#fi
# get the newest version of the containerized web application and run it

docker system prune -af


docker pull ${DOCKER_ID}/hncfrontend:${BUILD_NUMBER}
docker run -d -ti -p 8083:8080 ${DOCKER_ID}/hncfrontend:${BUILD_NUMBER}
