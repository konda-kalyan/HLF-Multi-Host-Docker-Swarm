#!/bin/bash -eu

#set -ev

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

#copy artifacts to Worker nodes
scp -r channel-artifacts crypto-config ubuntu@$WORKER_NODE1_HOSTNAME:~/HLF-Multi-Host-Docker-Swarm/network
scp -r channel-artifacts crypto-config ubuntu@$WORKER_NODE2_HOSTNAME:~/HLF-Multi-Host-Docker-Swarm/network

# copy chaincodes as well
scp -r ../chaincodes/ ubuntu@$WORKER_NODE1_HOSTNAME:~/HLF-Multi-Host-Docker-Swarm/
scp -r ../chaincodes/ ubuntu@$WORKER_NODE2_HOSTNAME:~/HLF-Multi-Host-Docker-Swarm/

#On Workder nodes, copy artifacts to command dir (/var/mynetwork/)
ssh ubuntu@$WORKER_NODE1_HOSTNAME 'cd ~/HLF-Multi-Host-Docker-Swarm/network; ./copy_crypto.sh'
ssh ubuntu@$WORKER_NODE2_HOSTNAME 'cd ~/HLF-Multi-Host-Docker-Swarm/network; ./copy_crypto.sh'
