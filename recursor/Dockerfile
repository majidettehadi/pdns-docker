FROM majid7221/debian:stretch

ARG VERSION=44
COPY files/pdns-pin /etc/apt/preferences.d/pdns

RUN set -ex \
    && echo 'deb [arch=amd64] http://repo.powerdns.com/debian stretch-rec-${VERSION} main' > /etc/apt/sources.list.d/pdns.list \
    && curl https://repo.powerdns.com/FD380FBB-pub.asc | apt-key add - \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        pdns-recursor \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

COPY files/recursor.conf /etc/powerdns/recursor.conf
COPY files/docker-entry /docker-entry

# DNS Port
EXPOSE 53/tcp 53/udp

ENTRYPOINT ["/docker-entry"]
CMD ["/usr/sbin/pdns_recursor"]
