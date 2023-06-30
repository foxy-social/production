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
  docker exec -it foxy-postgres15 psql -h 127.0.0.1 -U akkoma akkoma
end

function restart
  switch $argv[1]
  case all
    systemctl --user stop app app-postgres15 app-redis app-elasticsearch
    systemctl --user start app-postgres15 app-redis app-elasticsearch app
  case akkoma
    systemctl --user stop app
    systemctl --user start app
  case '*'
    systemctl --user stop $argv[1]
    systemctl --user start $argv[1]
  end
end

function akkoma
  if docker ps -a -q -f name=foxy-app-management
    docker kill foxy-app-management
  end
  
  if docker ps -aq -f status=exited -f name=foxy-app-management
    docker rm -v foxy-app-management
  end

  docker create \
    --name foxy-app-management \
    --network foxy-network-app \
    --hostname app-management \
    --env-file /home/app/docker/.env \
    -v /home/app/docker/app:/opt/akkoma \
    app:latest
  
  docker network connect foxy-network-elastic foxy-app-management
  docker network connect foxy-network-postgres foxy-app-management
  docker network connect foxy-network-redis foxy-app-management
  
  docker start foxy-app-management

  docker exec -it foxy-app-management $argv

  docker stop foxy-app-management
  docker rm foxy-app-management
end
