FROM docker.io/arm64v8/ubuntu:latest

ENV BUILDIMG 2022-04-04-raspios-bullseye-arm64-lite

WORKDIR /opt/osbuild

ADD build build
ADD files files 

RUN apt-get update && apt-get install -y wget xz-utils 

RUN wget https://downloads.raspberrypi.org/raspios_lite_arm64/images/raspios_lite_arm64-2022-04-07/$BUILDIMG.img.xz
RUN xz -d $BUILDIMG.img.xz && mkdir build/img && mkdir build/mnt && mkdir build/mnt2 && mkdir build/dest && mv $BUILDIMG.img build/img

WORKDIR /opt/osbuild/build
ENTRYPOINT [ "bash", "create.sh", "$BUILDIMG" ]
