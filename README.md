# docker-events
docker collect "docker system events" log

使用方法：

1. 执行构建image
sh build.sh

2. 执行构建service
sh service.sh

本job的目的是搜集docker swarm 的所有节点上的 docker system events 产生的日志，当然也可以搜集单个节点的docker system events 产生的日志

流程如下：

1.通过--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock将docker host的docker sock文件挂载到新建的docker events容器内
2.docker events容器调用docker python API命令获取docker system events的日志，并输出到容器的stdout
3.docker events容器配置--log-driver=fluentd选项将stdout日志经由fluentd归集到elasticsearch，kibana日志系统进行查看
