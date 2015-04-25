FROM fedora

MAINTAINER Benjamin Lechner, linux@lechners.info

#RUN yum groupinstall -y "LXDE Desktop"
RUN yum install -y lxde-common
RUN yum groupinstall -y LibreOffice
RUN yum install -y open-sans-fonts x11vnc firefox nano gcc make

EXPOSE 9501
ENV DISPLAY=:0

#create x11vnc random password
RUN tr -dc A-Za-z0-9 < /dev/urandom | head -c 10 > VncPassword.txt

#Start LXDE and X11VNC
ADD startup.sh /
ENTRYPOINT ./startup.sh