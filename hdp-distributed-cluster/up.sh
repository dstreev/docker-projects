#!/bin/bash

. ./init.sh $@

# Create the network
#docker ${DOCKER_OPTS} network create --driver=overlay --subnet 10.0.10.0/24 --attachable core

echo "Clean up: "
#pdsh -g dk rm -rf /var/local/hdp/${CLUSTER_PREFIX}${AMBARI_INSTANCE}/data
pdsh -g dks mkdir -p /var/local/hdp/${CLUSTER_PREFIX}${AMBARI_INSTANCE}/data



# Deploy the stack
#docker ${DOCKER_OPTS} stack deploy ambari_${AMBARI_INSTANCE} --compose-file=./docker-compose.yml

# Deploy on Swarm, but as individual containers
# Ambari Server
export AGENT=1
docker -H d6:2375 run -h ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT}.core --privileged --network-alias ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT}.core -P --name ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT} -d --network core --dns-search=core --restart=unless-stopped -e "AMBARI_VERSION=${AMBARI_VERSION}" -e "CLUSTER_PREFIX=${CLUSTER_PREFIX}" -e "AMBARI_INSTANCE=${AMBARI_INSTANCE}" -e "AMBARI_SERVER=true" -e "AGENT=0${AGENT}" -e "REPO_BASE_URL=${REPO_BASE_URL}" -v "/var/local/hdp/${CLUSTER_PREFIX}${AMBARI_INSTANCE}/data:/data" dstreev/centos7_ambari:2

export AGENT=2
docker -H d7:2375 run -h ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT}.core --privileged --network-alias ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT}.core -P --name ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT} -d --network core --dns-search=core --restart=unless-stopped -e "AMBARI_VERSION=${AMBARI_VERSION}" -e "CLUSTER_PREFIX=${CLUSTER_PREFIX}" -e "AMBARI_INSTANCE=${AMBARI_INSTANCE}" -e "AMBARI_AGENT=true" -e "AGENT=0${AGENT}" -e "REPO_BASE_URL=${REPO_BASE_URL}" -v "/var/local/hdp/${CLUSTER_PREFIX}${AMBARI_INSTANCE}/data:/data" dstreev/centos7_ambari:2

export AGENT=3
docker -H d3:2375 run -h ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT}.core --privileged --network-alias ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT}.core -P --name ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT} -d --network core --dns-search=core --restart=unless-stopped -e "AMBARI_VERSION=${AMBARI_VERSION}" -e "CLUSTER_PREFIX=${CLUSTER_PREFIX}" -e "AMBARI_INSTANCE=${AMBARI_INSTANCE}" -e "AMBARI_AGENT=true" -e "NIFI_VERSION=${NIFI_VERSION}" -e "AGENT=0${AGENT}" -e "REPO_BASE_URL=${REPO_BASE_URL}" -v "/var/local/hdp/${CLUSTER_PREFIX}${AMBARI_INSTANCE}/data:/data" dstreev/centos7_ambari:2

export AGENT=4
docker -H d4:2375 run -h ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT}.core --privileged --network-alias ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT}.core -P --name ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT} -d --network core --dns-search=core --restart=unless-stopped -e "AMBARI_VERSION=${AMBARI_VERSION}" -e "CLUSTER_PREFIX=${CLUSTER_PREFIX}" -e "AMBARI_INSTANCE=${AMBARI_INSTANCE}" -e "AMBARI_AGENT=true" -e "AGENT=0${AGENT}" -e "REPO_BASE_URL=${REPO_BASE_URL}" -v "/var/local/hdp/${CLUSTER_PREFIX}${AMBARI_INSTANCE}/data:/data" dstreev/centos7_ambari:2

export AGENT=5
docker -H d5:2375 run -h ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT}.core --privileged --net-alias ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT}.core -P --name ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT} -d --network core --dns-search=core --restart=unless-stopped -e "AMBARI_VERSION=${AMBARI_VERSION}" -e "CLUSTER_PREFIX=${CLUSTER_PREFIX}" -e "AMBARI_INSTANCE=${AMBARI_INSTANCE}" -e "AMBARI_AGENT=true" -e "AGENT=0${AGENT}" -e "REPO_BASE_URL=${REPO_BASE_URL}" -v "/var/local/hdp/${CLUSTER_PREFIX}${AMBARI_INSTANCE}/data:/data" dstreev/centos7_ambari:2

export AGENT=6
docker -H d1:2375 run -h ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT}.core --privileged --net-alias ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT}.core -P --name ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT} -d --network core --dns-search=core --restart=unless-stopped -e "AMBARI_VERSION=${AMBARI_VERSION}" -e "CLUSTER_PREFIX=${CLUSTER_PREFIX}" -e "AMBARI_INSTANCE=${AMBARI_INSTANCE}" -e "AMBARI_AGENT=true" -e "AGENT=0${AGENT}" -e "REPO_BASE_URL=${REPO_BASE_URL}" -v "/var/local/hdp/${CLUSTER_PREFIX}${AMBARI_INSTANCE}/data:/data" dstreev/centos7_ambari:2

export AGENT=7
docker -H d2:2375 run -h ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT}.core --privileged --network-alias ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT}.core -P --name ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT} -d --network core --dns-search=core --restart=unless-stopped -e "AMBARI_VERSION=${AMBARI_VERSION}" -e "CLUSTER_PREFIX=${CLUSTER_PREFIX}" -e "AMBARI_INSTANCE=${AMBARI_INSTANCE}" -e "AMBARI_AGENT=true" -e "NIFI_SERVER=true" -e "NIFI_VERSION=${NIFI_VERSION}" -e "HDF_VERSION=${HDF_VERSION}" -e "AGENT=0${AGENT}" -e "REPO_BASE_URL=${REPO_BASE_URL}" -v "/var/local/hdp/${CLUSTER_PREFIX}${AMBARI_INSTANCE}/data:/data" dstreev/centos7_ambari:2

export AGENT=8
docker -H d8:2375 run -h ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT}.core --privileged --net-alias ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT}.core -P --name ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT} -d --network core --dns-search=core --restart=unless-stopped -e "AMBARI_VERSION=${AMBARI_VERSION}" -e "CLUSTER_PREFIX=${CLUSTER_PREFIX}" -e "AMBARI_INSTANCE=${AMBARI_INSTANCE}" -e "AMBARI_AGENT=true" -e "AGENT=0${AGENT}" -e "REPO_BASE_URL=${REPO_BASE_URL}" -v "/var/local/hdp/${CLUSTER_PREFIX}${AMBARI_INSTANCE}/data:/data" dstreev/centos7_ambari:2

export AGENT=9
docker -H d9:2375 run -h ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT}.core --privileged --net-alias ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT}.core -P --name ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent0${AGENT} -d --network core --dns-search=core --restart=unless-stopped -e "AMBARI_VERSION=${AMBARI_VERSION}" -e "CLUSTER_PREFIX=${CLUSTER_PREFIX}" -e "AMBARI_INSTANCE=${AMBARI_INSTANCE}" -e "AMBARI_AGENT=true" -e "AGENT=0${AGENT}" -e "REPO_BASE_URL=${REPO_BASE_URL}" -v "/var/local/hdp/${CLUSTER_PREFIX}${AMBARI_INSTANCE}/data:/data" dstreev/centos7_ambari:2

export AGENT=10
docker -H d10:2375 run -h ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent${AGENT}.core --privileged --net-alias ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent${AGENT}.core -P --name ${CLUSTER_PREFIX}${AMBARI_INSTANCE}agent${AGENT} -d --network core --dns-search=core --restart=unless-stopped -e "AMBARI_VERSION=${AMBARI_VERSION}" -e "CLUSTER_PREFIX=${CLUSTER_PREFIX}" -e "AMBARI_INSTANCE=${AMBARI_INSTANCE}" -e "AMBARI_AGENT=true" -e "AGENT=${AGENT}" -e "REPO_BASE_URL=${REPO_BASE_URL}" -v "/var/local/hdp/${CLUSTER_PREFIX}${AMBARI_INSTANCE}/data:/data" dstreev/centos7_ambari:2

. ./ps.sh
