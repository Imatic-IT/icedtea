FROM debian:jessie
ARG DEBIAN_FRONTEND=noninteractive
ENV USER=icedtea
RUN apt-get update; \
  apt-get upgrade; \
  apt-get --no-install-recommends --yes install iceweasel  icedtea-7-plugin xterm
#Remove all week and disabled protocols, jar signatures - needed for old ipmi servers
RUN sed -e '/disabled/{s/^/#/}' -i /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/java.security
COPY /entrypoint.sh /
CMD /entrypoint.sh
