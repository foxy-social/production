#!/bin/sh
/home/app/docker/services/stop-app.sh

docker create \
  --name foxy-app \
  --network foxy-network-app \
  --hostname app \
  --env-file /home/app/docker/.env \
  -v /home/app/docker/app:/opt/akkoma \
  -v /home/app/docker/soapbox:/var/www/soapbox \
  app:latest

docker network connect foxy-network-web foxy-app
docker network connect foxy-network-elastic foxy-app
docker network connect foxy-network-postgres foxy-app
docker network connect foxy-network-redis foxy-app

docker start -ia foxy-app
