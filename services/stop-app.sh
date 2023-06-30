#!/bin/sh
if [ "$(docker ps -a -q -f name=foxy-app)" ]; then
  docker kill foxy-app
fi

if [ "$(docker ps -aq -f status=exited -f name=foxy-app)" ]; then
  docker rm -v foxy-app
fi
