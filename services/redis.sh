#!/bin/sh
docker run \
  --rm \
  --name foxy-redis \
  --hostname redis \
  --network foxy-network-redis \
  redis:7.0.11-alpine
