#!/bin/sh
docker build --build-arg UID=$(id -u) --network host -t app ./app
docker build --build-arg UID=$(id -u) --network host -t db ./app/docker-resources/database
docker build --network host -t web ./web
