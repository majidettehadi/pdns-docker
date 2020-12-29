FROM majid7221/debian:stretch

ARG VERSION=44
COPY files/pdns-pin /etc/apt/preferences.d/pdns

RUN set -ex \
    && echo "deb [arch=amd64] http://repo.powerdns.com/debian stretch-auth-${VERSION} main" > /etc/apt/sources.list.d/pdns.list \
    && curl https://repo.powerdns.com/FD380FBB-pub.asc | apt-key add - \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        pdns-server \
        pdns-backend-pgsql \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

COPY files/powerdns.sql /etc/powerdns/powerdns.sql
COPY files/docker-entry /docker-entry

# API PORT
EXPOSE 8081
# DNS PORT 
EXPOSE 53/tcp 53/udp

ENTRYPOINT ["/docker-entry"]
CMD ["/usr/sbin/pdns_server","--config-dir=/etc/powerdns"]
