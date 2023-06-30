#!/bin/sh
/home/app/docker/services/stop-web.sh

docker create \
  --name foxy-web \
  --network foxy-network-web \
  --hostname philomena \
  --env-file /home/app/docker/.env \
  -p 443:443 \
  app:latest

docker network connect foxy-network-app foxy-web

docker start -ia foxy-web
