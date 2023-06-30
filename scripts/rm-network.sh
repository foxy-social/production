#!/bin/sh
docker network rm foxy-network-app
docker network rm foxy-network-redis
docker network rm foxy-network-elastic
docker network rm foxy-network-postgres
docker network rm foxy-network-web
