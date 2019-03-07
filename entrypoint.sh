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
unset MSG_ENV

if [ -z "$PROFILE" ];then
	MSG_ENV="UNSET PROFILE\n"
fi

if [ -z "$GIT_REPOSITORY_URI" ];then
	MSG_ENV="$MSG_ENV UNSET GIT_REPOSITORY_URI\n"
fi

if [ -z "$GIT_USERNAME" ];then
	MSG_ENV="$MSG_ENV UNSET GIT_USERNAME\n"
fi

if [ -z "$GIT_PASSWORD" ];then
	MSG_ENV="$MSG_ENV UNSET GIT_PASSWORD\n"
fi

if [ -z "$PASS_CONFIG_SERVER" ];then
	MSG_ENV="$MSG_ENV UNSET PASS_CONFIG_SERVER\n"
fi

if [ -z "$SERVER_PORT" ];then
	MSG_ENV="$MSG_ENV UNSET SERVER_PORT\n"
fi


if [ -z "$MSG_ENV" ];then
	echo "ENV"
else
	echo $MSG_ENV
	exit 1
fi


if [ -z "$1" ];then
	echo "PARAM EMPTY"
else
	if [ -f $1 ]; then
		java ${JAVA_OPS} -jar $1 \
			--spring.profiles.active=$PROFILE \
			--spring.cloud.config.server.git.uri=$GIT_REPOSITORY_URI \
			--spring.cloud.config.server.git.username=$GIT_USERNAME \
			--spring.cloud.config.server.git.password=$GIT_PASSWORD \
			--spring.security.user.password=$PASS_CONFIG_SERVER \
			--server.port=$SERVER_PORT \
			--spring.cloud.config.server.prefix=/config 
	else
		echo "NOT FOUND FILE: $1"
	fi
fi