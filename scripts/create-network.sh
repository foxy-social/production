#!/bin/sh
docker network create \
  --driver=bridge \
  --subnet=10.11.0.0/24 \
  --opt com.docker.network.bridge.name=br-foxapp \
  foxy-network-app

docker network create \
  --driver=bridge \
  --subnet=10.12.0.0/24 \
  --internal \
  --opt com.docker.network.bridge.name=br-foxsearch \
  foxy-network-osearch

docker network create \
  --driver=bridge \
  --subnet=10.14.0.0/24 \
  --internal \
  --opt com.docker.network.bridge.name=br-foxpostgres \
  foxy-network-postgres

docker network create \
  --driver=bridge \
  --subnet=10.15.0.0/24 \
  --opt com.docker.network.bridge.name=br-foxweb \
  foxy-network-web
