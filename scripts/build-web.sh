#!/bin/sh
export $(cat /home/foxy/docker/.env | xargs)

docker build --build-arg AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID --build-arg AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY --network host -t web ./web
