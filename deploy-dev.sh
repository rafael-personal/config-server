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

# BUILD CODE AND DOCKER BUILD IMAGE 
./mvnw clean
./mvnw install -DskipTests
docker build -t  iconfigserver . 

# RUN CONTAINER IN DOCKER 
CID=$(docker run -d --env-file setvar-dev iconfigserver)
echo ID CONTAINER: $CID
IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CID)
echo CONTAINER IP: $IP
