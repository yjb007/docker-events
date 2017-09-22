#!/bin/bash

set -x

docker service rm docker-events

docker service create \
  --name docker-events \
  --network my_network \
  --mode global \
  --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
  --log-driver=fluentd \
  --log-opt=fluentd-address=your_fluentd_ipaddress:24224 \
  --log-opt=tag=docker.{{.Name}}.{{.ImageName}} \
docker_events