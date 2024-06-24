#!/bin/sh
systemctl --user stop foxy-app
systemctl --user stop foxy-valkey
systemctl --user stop foxy-postgres16
systemctl --user stop foxy-opensearch
