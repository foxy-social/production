#!/bin/sh
docker network create \
  --driver=bridge \
  --subnet=10.11.0.0/24 \
  --opt com.docker.network.bridge.name=br-app \
  foxy-network-app

docker network create \
  --driver=bridge \
  --subnet=10.12.0.0/24 \
  --internal \
  --opt com.docker.network.bridge.name=br-osearch \
  foxy-network-osearch

docker network create \
  --driver=bridge \
  --subnet=10.13.0.0/24 \
  --internal \
  --opt com.docker.network.bridge.name=br-valkey \
  foxy-network-valkey

docker network create \
  --driver=bridge \
  --subnet=10.14.0.0/24 \
  --internal \
  --opt com.docker.network.bridge.name=br-postgres \
  foxy-network-postgres

docker network create \
  --driver=bridge \
  --subnet=10.15.0.0/24 \
  --opt com.docker.network.bridge.name=br-web \
  foxy-network-web
