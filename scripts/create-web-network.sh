docker network create \
  --driver=bridge \
  --subnet=10.16.0.0/24 \
  --opt com.docker.network.bridge.name=br-foxcamo \
  foxy-network-gocamo
