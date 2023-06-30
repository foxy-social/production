#!/bin/sh
if ! (docker info); then
  exit 1
fi

while true
do
  sleep 10
done
