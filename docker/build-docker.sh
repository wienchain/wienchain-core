#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-wienchain/wienchaind-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/wienchaind docker/bin/
cp $BUILD_DIR/src/wienchain-cli docker/bin/
cp $BUILD_DIR/src/wienchain-tx docker/bin/
strip docker/bin/wienchaind
strip docker/bin/wienchain-cli
strip docker/bin/wienchain-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
