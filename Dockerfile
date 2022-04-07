FROM docker.io/arm64v8/ubuntu:latest

WORKDIR /opt/osbuild

ADD build build
ADD files files 

RUN apt-get update && apt install -y wget

RUN wget https://downloads.raspberrypi.org/raspios_lite_arm64/images/raspios_lite_arm64-2022-04-07/2022-04-04-raspios-bullseye-arm64-lite.img.xz -O pi.img.xz

RUN apt-get install xz-utils 

RUN xz -d pi.img.xz

#RUN mkdir build/img
#RUN tar -xf pi.img.xz -C build/img

ENTRYPOINT [ "ls", "-la", "." ]
