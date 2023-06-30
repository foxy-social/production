#!/bin/sh
if [ "$(docker ps -a -q -f name=foxy-web)" ]; then
  docker kill foxy-web
fi

if [ "$(docker ps -aq -f status=exited -f name=foxy-web)" ]; then
  docker rm -v foxy-web
fi
