#!/usr/bin/env python
#_*_  coding:utf-8  _*_

import docker
client = docker.DockerClient(base_url='unix://var/run/docker.sock')
with open("/var/log/events.log","ab") as f:
    for event in client.events():
        event = event.replace('.','\\\.')
        f.write(event)