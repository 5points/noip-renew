FROM alpine:latest
MAINTAINER loblab

ARG USER=loblab
ARG UID=1000
ARG HOME=/noip-renew
#ARG TZ=Asia/Shanghai
#ARG APT_MIRROR=mirrors.163.com
#ARG DEBIAN_FRONTED=noninteractive
ARG PYTHON=python

#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#RUN sed -i "s/deb.debian.org/$APT_MIRROR/" /etc/apt/sources.list
RUN add --no-cache  \
    py-pip  \
    curl \
    wget \
    chromium-chromedriver
RUN $PYTHON -m pip install selenium

RUN useradd -d $HOME -u $UID $USER
USER $USER
WORKDIR $HOME
CMD ["bash"]
