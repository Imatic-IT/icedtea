FROM debian:jessie
ARG DEBIAN_FRONTEND=noninteractive
ENV USER=icedtea
RUN sed -i 's/deb.debian.org/archive.debian.org/' /etc/apt/sources.list; \
    sed -i 's/security.debian.org/archive.debian.org/' /etc/apt/sources.list; \ 
    sed -i '/jessie-updates/d' /etc/apt/sources.list; \
    sed -i 's/^deb /deb [trusted=yes] /' /etc/apt/sources.list
RUN apt-get update; \
  apt-get upgrade; \
  apt-get --no-install-recommends --force-yes --yes install iceweasel  icedtea-7-plugin xterm
#Remove all week and disabled protocols, jar signatures - needed for old ipmi servers
RUN sed -e '/disabled/{s/^/#/}' -i /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/java.security
COPY /entrypoint.sh /
CMD /entrypoint.sh
