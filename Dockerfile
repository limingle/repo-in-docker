FROM alpine as base

ENV LANG C.UTF-8
ENV TZ=Asia/Shanghai

ARG packages
RUN sed -i \
        -e 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' \
        /etc/apk/repositories \
        && apk add --update --no-cache ${packages}

FROM base
MAINTAINER alexlee alexander.lee.cn@gmail.com
ARG userid
ARG groupid
ARG username

ENV HOME=/home/$username

RUN adduser -u $userid $username $groupid -D

ENTRYPOINT [ "/bin/sh", "-c" ]
CMD ["echo -e \"USEAGE:\ndocker_<entry> [arg1 [arg2 [...] ] ]\""]
