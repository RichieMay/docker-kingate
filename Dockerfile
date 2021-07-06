#基础镜像使用官方centos 7.4.1708
FROM centos:7.4.1708

#作者
MAINTAINER RichieMay <mayboe@gmail.com>

ENV KINGATE_VERSION   2.2
ENV KINGATE_RELEASE   "kingate-${KINGATE_VERSION}"

RUN mkdir -p /opt
ADD kingate-2.2 /opt/kingate-2.2

RUN chown -R daemon:daemon "/opt/${KINGATE_RELEASE}" \
    && chmod +x "/opt/${KINGATE_RELEASE}/bin/kingate"

USER daemon:daemon

EXPOSE 2222

WORKDIR "/opt/kingate-2.2"

ENTRYPOINT ["/opt/kingate-2.2/bin/kingate", "-n"]
