#!/bin/sh
/home/foxy/docker/services/stop-web.sh

docker create \
  --name foxy-web \
  --network foxy-network-web \
  --hostname philomena \
  --env-file /home/foxy/docker/.env \
  -v /home/foxy/docker/web/certs:/etc/ssl/private \
  -v /home/foxy/docker/web/www:/var/www \
  -p 443:443 \
  web:latest

docker network connect foxy-network-app foxy-web

docker start -ia foxy-web
