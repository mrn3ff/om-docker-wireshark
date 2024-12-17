FROM ubuntu:20.04

ENV XPRA_PORT=14500

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apt-transport-https software-properties-common wget gnupg

RUN wget -q https://xpra.org/gpg.asc -O- | apt-key add - 

RUN add-apt-repository 'deb https://xpra.org/ focal main'

RUN apt-get update && apt-get install -y xpra wireshark xfce4

RUN mkdir -p /run/user/0/xpra

CMD /usr/bin/xpra start :100 --start-child=wireshark --pulseaudio=no --bind-tcp=0.0.0.0:$XPRA_PORT --no-daemon --exit-with-children --notifications=no --printing=no --mdns=no --webcam=no --systemd-run=no --dbus-proxy=no --dbus-control=no --dbus-launch=no --speaker=off --microphone=no --sharing=yes --start-new-commands=yes --dpi=96
