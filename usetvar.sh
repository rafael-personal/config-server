#!/bin/sh
############################################################################
#title           :deploy.sh
#description     :Este script es para hacer build y desplegar en docker (develop) .
#author		     : Rafael Fernandez
#date            :20190220
#version         :0.1
#usage		     :sh deploy.sh
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

if [ -f environment-$PROFILE ]
then
#SET ENV VARS
unset $(grep -v '^#' environment-$PROFILE | cut -d'=' -f1 | xargs)
unset $PROFILE
else
echo NOT FOUND FILE: environment-$PROFILE
fi