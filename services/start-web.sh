#!/bin/sh
/home/foxy/docker/services/stop-web.sh

docker create \
  --name foxy-web \
  --hostname foxysocial \
  --network host \
  --env-file /home/foxy/docker/.env \
  -v /home/foxy/docker/web/certs:/etc/ssl/private \
  -v /home/foxy/docker/web/www:/var/www \
  web:latest

docker start -ia foxy-web
