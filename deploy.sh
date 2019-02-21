#!/bin/sh
############################################################################
#title           :deploy.sh
#description     :Este script es para hacer build y desplegar en docker (develop) .
#author		 : Rafael Fernandez
#date            :20190220
#version         :0.1
#usage		 :sh deploy.sh
#notes           :Install docker y java, java y maven para usar este script.
#                :las variables en el file setvar son de desarrollo
#==============================================================================
PROFILE=$1
#READ PROFILE TO DEPLOY
if [ -z "$PROFILE" ]
then
echo "PROFILE:"
read PROFILE
fi


#SET ENV VARS
export $(grep -v '^#' setvar-$PROFILE | xargs)

# BUILD CODE 
./mvnw clean
./mvnw install -DskipTests

#BUILD IMAGE
docker build --tag $DOCKER_IMAGE .

# RUN CONTAINER IN DOCKER
CID=$(docker run -d --network=$NETWORK --env-file setvar-dev $DOCKER_IMAGE)
IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CID)
GATEWAY=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.Gateway}}{{end}}' $CID)

echo "[INFO] ------------------------------------------------------------------------"
echo "[INFO] DEPLOYED (INFO CONTAINER)"
echo "[INFO] ------------------------------------------------------------------------"
echo "[INFO] Docker Image: $DOCKER_IMAGE"
echo "[INFO] Id Container: $CID"
echo "[INFO] Network: $NETWORK "
echo "[INFO] IP Container: $IP"
echo "[INFO] Gateway: $GATEWAY"
echo "[INFO] ------------------------------------------------------------------------"
echo "[INFO]"
echo "[INFO] ------------------------------------------------------------------------"
echo "[INFO] SPRING CLOUD CONFIGURATION SERVER (INFO)"
echo "[INFO] ------------------------------------------------------------------------"
echo "[INFO] Git Repository: $GIT_REPOSITORY_URI"
echo "[INFO] User: $GIT_USERNAME"
echo "[INFO] Password: ********"
echo "[INFO] Security: true"
echo "[INFO] ------------------------------------------------------------------------"
echo "[INFO] CONSUL CLINT DISCOVERY (INFO)"
echo "[INFO] ------------------------------------------------------------------------"
echo "[INFO]	CONSUL HOST: $CONSUL_SERVER"
echo "[INFO]	CONSUL PORT: $CONSUL_PORT"

unset $PROFILE
unset $(grep -v '^#' setvar-dev | cut -d'=' -f1 | xargs)
