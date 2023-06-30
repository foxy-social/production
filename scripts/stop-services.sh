#!/bin/sh
systemctl --user stop app
systemctl --user stop app-redis
systemctl --user stop app-postgres15
systemctl --user stop app-elasticsearch
