#!/bin/sh
/home/foxy/docker/services/stop-app.sh

docker create \
  --name foxy-app \
  --network foxy-network-app \
  --hostname app \
  --env-file /home/foxy/docker/.env \
  -v /home/foxy/docker/app:/opt/akkoma \
  app:latest

docker network connect foxy-network-web foxy-app
docker network connect foxy-network-osearch foxy-app
docker network connect foxy-network-postgres foxy-app
docker network connect foxy-network-valkey foxy-app

docker start -ia foxy-app
