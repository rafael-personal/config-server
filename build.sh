#!/bin/sh
############################################################################
#title           :build.sh
#description     :Este script es para hacer build (develop) .
#author		     : Rafael Fernandez
#date            :20190220
#version         :0.1
#usage		     :sh deploy.sh
#notes           :
#==============================================================================

# BUILD CODE 
./mvnw clean
./mvnw install -DskipTests
