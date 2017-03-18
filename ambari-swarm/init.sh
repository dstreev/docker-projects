#!/bin/bash

export DOCKER+OPTS="-H d7:2375"

export CLUSTER_PREFIX=${1:-DK}
export AMBARI_INSTANCE=${2:-01}
export OS_VERSION=${3:-centos7}
export AMBARI_VERSION=${4:-latest}
export NIFI_VERSION=${5:-latest}

echo "CLUSTER_PREFIX: ${CLUSTER_PREFIX}"
echo "AMBARI_INSTANCE: ${AMBARI_INSTANCE}"
echo "OS_VERSION: ${OS_VERSION}"
echo "AMBARI_VERSION: ${AMBARI_VERSION}"
echo "NIFI_VERSION: ${NIFI_VERSION}"
