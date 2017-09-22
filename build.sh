#!/bin/sh
set -ex

export IMAGE_NAME=docker_events

docker build --no-cache --pull -t $IMAGE_NAME ./