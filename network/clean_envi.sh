#!/bin/bash

docker stop $(docker ps -aq); docker rm -f $(docker ps -aq);
docker network rm $(docker network ls -q)
docker service rm $(docker service ls -q)
docker swarm leave -f
rm -rf config
rm -rf crypto-config
