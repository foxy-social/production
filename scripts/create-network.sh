#!/bin/sh
docker network create \
  --driver=bridge \
  --subnet=10.1.0.0/24 \
  --opt com.docker.network.bridge.name=br-app \
  foxy-network-app

docker network create \
  --driver=bridge \
  --subnet=10.2.0.0/24 \
  --internal \
  --opt com.docker.network.bridge.name=br-elastic \
  foxy-network-elastic

docker network create \
  --driver=bridge \
  --subnet=10.3.0.0/24 \
  --internal \
  --opt com.docker.network.bridge.name=br-redis \
  foxy-network-redis

docker network create \
  --driver=bridge \
  --subnet=10.4.0.0/24 \
  --internal \
  --opt com.docker.network.bridge.name=br-postgres \
  foxy-network-postgres

docker network create \
  --driver=bridge \
  --subnet=10.5.0.0/24 \
  --opt com.docker.network.bridge.name=br-web \
  foxy-network-web
