#!/bin/sh
/home/foxy/docker/services/stop-app.sh

docker create \
  --name foxy-app \
  --network foxy-network-app \
  --hostname foxysocial \
  --env-file /home/foxy/docker/.env \
  -v /home/foxy/docker/app:/opt/akkoma \
  -p 10.100.0.1:5000:4000 \
  foxyapp:latest

docker network connect foxy-network-web foxy-app
docker network connect foxy-network-osearch foxy-app
docker network connect foxy-network-postgres foxy-app

docker start -ia foxy-app
