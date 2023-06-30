#!/bin/sh
docker run \
  --rm \
  --name foxy-elasticsearch \
  --hostname elasticsearch \
  --network foxy-network-elastic \
  -e "discovery.type=single-node" \
  -e TAKE_FILE_OWNERSHIP=true \
  --ulimit nofile=65536:65536 \
  -v /home/app/volumes/elasticsearch:/usr/share/elasticsearch/data \
  -v /home/app/docker/configs/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
  -v /home/app/docker/configs/jvm.options:/usr/share/elasticsearch/config/jvm.options \
  elasticsearch:7.17.9
