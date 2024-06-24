#!/bin/env fish
export XDG_RUNTIME_DIR=/run/user/(id -u)

function viewlogs
  if $argv[1]
    journalctl --user -f -n 100 --user-unit $argv[1]
  else
    journalctl --user -f -n 100
  end
end

function psql
  docker exec -it foxy-postgres16 psql -h 127.0.0.1 -U akkoma akkoma
end

function restart
  switch $argv[1]
  case all
    systemctl --user stop foxy-app foxy-postgres16 foxy-valkey foxy-opensearch
    systemctl --user start foxy-postgres16 foxy-valkey foxy-opensearch foxy-app
  case akkoma
    systemctl --user stop foxy-app
    systemctl --user start foxy-app
  case '*'
    systemctl --user stop $argv[1]
    systemctl --user start $argv[1]
  end
end

function akkoma
  if docker ps -a -q -f name=foxy-foxy-management
    docker kill foxy-foxy-management
  end
  
  if docker ps -aq -f status=exited -f name=foxy-app-management
    docker rm -v foxy-app-management
  end

  docker create \
    --name foxy-app-management \
    --network foxy-network-app \
    --hostname foxy-app-management \
    --env-file /home/foxy/docker/.env \
    -v /home/foxy/docker/app:/opt/akkoma \
    foxyapp:latest \
    /opt/akkoma/sleep.sh
  
  docker network connect foxy-network-osearch foxy-app-management
  docker network connect foxy-network-postgres foxy-app-management
  docker network connect foxy-network-valkey foxy-app-management
  
  docker start foxy-app-management

  docker exec -it foxy-app-management $argv

  docker stop foxy-app-management
  docker rm foxy-app-management
end
