#!/bin/sh
export $(cat /home/foxy/docker/.env | xargs)

docker build --build-arg UID=$(id -u) --network host -t foxyapp ./app
docker build --build-arg UID=$(id -u) --network host -t db ./app/docker-resources/database
#docker build --build-arg AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID --build-arg AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY --network host -t web ./web
