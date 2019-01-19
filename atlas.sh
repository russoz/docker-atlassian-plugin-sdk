#!/usr/bin/env bash

IMAGE=${IMAGE:-russoz/docker-atlassian-plugin-sdk}
PORT=${PORT:-2990}
EXTERNAL_HOME=$(pwd)/.user
INTERNAL_HOME=/project/user
MAVEN_CONFIG=${MAVEN_CONFIG:-${HOME}/.m2}
INTERNAL_MAVEN_CONFIG=${INTERNAL_HOME}/.m2

mkdir -p ${EXTERNAL_HOME}/{.m2,.java}

port_param=""
[[ "$1" == "run" || "$1" == "atlas-run" ]] && port_param="-p ${PORT}:2990"

docker run -it --rm \
    $port_param \
    -v $(pwd):/project/root \
    -v ${EXTERNAL_HOME}:${INTERNAL_HOME} \
    -v ${MAVEN_CONFIG}:${INTERNAL_MAVEN_CONFIG} \
    -e MAVEN_CONFIG=${INTERNAL_MAVEN_CONFIG} \
    -e JAVA_TOOL_OPTIONS="-Duser.home=${INTERNAL_HOME} -Djava.util.prefs.systemRoot=${INTERNAL_HOME}/.java" \
    -e HOME=${INTERNAL_HOME} \
    -u $UID \
    ${IMAGE} "$@"
