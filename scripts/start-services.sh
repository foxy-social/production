#!/bin/sh
systemctl --user start app-valkey
systemctl --user start app-postgres16
systemctl --user start app-opensearch

sleep 20

systemctl --user start foxy-app
