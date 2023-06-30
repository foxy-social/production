#!/bin/sh
docker run \
  --rm \
  --name foxy-postgres15 \
  --hostname db \
  --network foxy-network-postgres \
  --shm-size=1g \
  -e POSTGRES_PASSWORD=akkoma \
  -e POSTGRES_USER=akkoma \
  -e POSTGRES_HOST_AUTH_METHOD=trust \
  -e POSTGRES_INITDB_ARGS="--locale-provider=icu --icu-locale=en-US" \
  -e LANG=en_US.utf8 \
  -v /home/app/volumes/postgres15:/var/lib/postgresql/data \
  -v /home/app/docker/configs/postgresql.conf:/etc/postgresql/postgresql.conf \
  postgres:15.3-alpine
