FROM alpine:3.18.0

LABEL maintainer="Hao Jiangwei <270430820@qq.com>"

ENV TZ=Asia/Shanghai

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    echo -e "https://mirrors.aliyun.com/alpine/edge/testing\nhttps://mirrors.aliyun.com/alpine/edge/community" >> /etc/apk/repositories && \
	apk --no-cache update && \
	apk --no-cache upgrade && \
	apk add --no-cache tzdata && \
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
	echo $TZ > /etc/timezone
	
CMD ["/bin/sh"]
