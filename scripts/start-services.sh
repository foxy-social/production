#!/bin/sh
systemctl --user start app-redis
systemctl --user start app-postgres15
systemctl --user start app-elasticsearch

sleep 20

systemctl --user start app
