#!/bin/sh
docker run \
  --rm \
  --name foxy-valkey \
  --hostname valkey \
  --network foxy-network-valkey \
  valkey/valkey:7.2.5-alpine
