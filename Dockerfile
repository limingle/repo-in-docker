FROM alpine as downloader

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --update --no-cache curl \
    && curl -sSL  'https://gerrit-googlesource.proxy.ustclug.org/git-repo/+/stable/repo?format=TEXT' | base64 -d > /usr/bin/repo \
    && chmod +x /usr/bin/repo


FROM alpine as base

ENV LANG C.UTF-8
ENV TZ=Asia/Shanghai

COPY --from=downloader /usr/bin/repo /usr/bin/repo

ARG packages
RUN sed -i \
        -e 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' \
        /etc/apk/repositories \
        && apk add --update --no-cache ${packages} \
        && ln -sf python3 /usr/bin/python

FROM base
MAINTAINER alexlee alexander.lee.cn@gmail.com
ARG userid
ARG groupid
ARG username

ENV HOME=/home/$username

RUN adduser -u $userid $username $groupid -D

ENTRYPOINT [ "/bin/sh", "-c" ]
CMD ["echo -e \"USEAGE:\ndocker_<entry> [arg1 [arg2 [...] ] ]\""]
