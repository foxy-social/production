#!/bin/sh
docker run \
  --rm \
  --name foxy-postgres16 \
  --hostname db \
  --network foxy-network-postgres \
  --shm-size=1g \
  -e POSTGRES_PASSWORD=akkoma \
  -e POSTGRES_USER=akkoma \
  -e POSTGRES_HOST_AUTH_METHOD=trust \
  -e POSTGRES_INITDB_ARGS="--locale-provider=icu --icu-locale=en-US" \
  -e LANG=en_US.utf8 \
  -v /home/foxy/volumes/postgres16:/var/lib/postgresql/data \
  -v /home/foxy/docker/configs/postgresql.conf:/etc/postgresql/postgresql.conf \
  postgres:16.3-alpine
