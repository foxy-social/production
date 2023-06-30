#!/bin/sh
docker build --network host -t app ./app
docker build --network host -t db ./app/docker-resources/database
docker build --network host -t web ./web
