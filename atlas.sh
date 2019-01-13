#!/usr/bin/env bash

IMAGE=${IMAGE:-russoz/docker-atlassian-plugin-sdk}
PORT=${PORT:-2990}
MAVEN_CONFIG=${MAVEN_CONFIG:-${HOME}/.m2}
M2_MOUNTPOINT=/.m2

docker run -it --rm \
    -p ${PORT}:2990 \
    -v ${MAVEN_CONFIG}:${M2_MOUNTPOINT} \
    -v $(pwd):/project \
    -e MAVEN_CONFIG=${M2_MOUNTPOINT} \
    -e JAVA_TOOL_OPTIONS="-Duser.home=/" \
    -u $UID \
    ${IMAGE} "$@"
