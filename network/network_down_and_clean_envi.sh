#!/bin/bash

docker service rm $(docker service ls -q)
#docker stop $(docker ps -aq); docker rm -f $(docker ps -aq);
docker swarm leave -f
docker network rm docker_gwbridge
rm -rf config
rm -rf crypto-config
