#!/bin/sh
systemctl --user start foxy-postgres16
systemctl --user start foxy-opensearch

sleep 20

systemctl --user start foxy-app
