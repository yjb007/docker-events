FROM alpine:3.5

ENV TZ=Asia/Shanghai
RUN echo "http://mirrors.aliyun.com/alpine/v3.5/main" >/etc/apk/repositories \ 
        && echo "http://mirrors.aliyun.com/alpine/v3.5/community" >>/etc/apk/repositories \
        && apk add --update tzdata \
        && apk add curl python py2-pip \
        && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
        && echo $TZ > /etc/timezone \
        && rm -rf /var/cache/apk/* \
        && pip install docker -i http://pypi.douban.com/simple/  --trusted-host pypi.douban.com \
        && ln -sf /dev/stdout /var/log/events.log

COPY events.py /events.py

CMD ["python","events.py"]
