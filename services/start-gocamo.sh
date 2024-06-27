#!/bin/sh
docker run \
  --rm \
  --name foxy-gocamo \
  --hostname gocamo \
  --network foxy-network-gocamo \
  --env-file /home/foxy/docker/.env \
  -p 127.0.0.1:8080:8080 \
  cactus4docker/go-camo:v2.4.13
