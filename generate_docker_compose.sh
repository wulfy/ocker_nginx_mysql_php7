#!/bin/bash 
source ./env.sh
rm -rf docker-compose.yml
envsubst < "docker-compose-template.yml" > "docker-compose.yml";
sh reset.sh