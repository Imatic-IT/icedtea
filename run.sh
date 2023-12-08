#!/bin/bash

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
VOL=$PWD/volume/
mkdir -p $VOL
touch $XAUTH

ENV_VARS+=" --env=DISPLAY=$DISPLAY"
ENV_VARS+=" --env=XAUTHORITY=${XAUTH}"
ENV_VARS+=" --env=UID=$(id -u)"
VOLUMES+=" --volume=${XSOCK}:${XSOCK}"
VOLUMES+=" --volume=${XAUTH}:${XAUTH}"
VOLUMES+=" --volume=$VOL:/volume"
#EXPOSE+=" -p 8080:80 -p 1883:1883"
#Allow to access X11
xauth nlist "$DISPLAY" | sed -e 's/^..../ffff/' | xauth -f "$XAUTH" nmerge -

docker  run --net=host -i -t $VOLUMES $ENV_VARS $EXPOSE icedtea:latest
