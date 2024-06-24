#!/bin/sh
docker run \
  --rm \
  --name foxy-opensearch \
  --hostname opensearch \
  --network foxy-network-osearch \
  -e TAKE_FILE_OWNERSHIP=true \
  --ulimit nofile=65536:65536 \
  -v /home/foxy/volumes/opensearch:/usr/share/opensearch/data \
  -v /home/foxy/docker/configs/opensearch.yml:/usr/share/opensearch/config/opensearch.yml \
  -v /home/foxy/docker/configs/jvm.options:/usr/share/opensearch/config/jvm.options \
  opensearchproject/opensearch:2.14.0
