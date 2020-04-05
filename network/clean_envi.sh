#!/bin/bash

docker stop $(docker ps -aq); docker rm -f $(docker ps -aq);
docker rmi -f $(docker images | grep fabric | awk '{print $3}')
docker network rm $(docker network ls -q)
docker service rm $(docker service ls -q)
docker swarm leave -f
