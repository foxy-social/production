#!/bin/sh
systemctl --user stop foxy-app
systemctl --user stop app-valkey
systemctl --user stop app-postgres16
systemctl --user stop app-opensearch
