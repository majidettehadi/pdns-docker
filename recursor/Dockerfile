FROM majid7221/debian:stretch

ENV DNS_PORT 9573

RUN set -ex \
    && echo 'deb [arch=amd64] http://repo.powerdns.com/debian stretch-rec-41 main' > /etc/apt/sources.list.d/pdns.list \
    && echo 'Package: pdns-*' > /etc/apt/preferences.d/pdns \
    && echo 'Pin: origin repo.powerdns.com' >> /etc/apt/preferences.d/pdns \
    && echo 'Pin-Priority: 600' >> /etc/apt/preferences.d/pdns \
    && curl https://repo.powerdns.com/FD380FBB-pub.asc | apt-key add - \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends \
        pdns-recursor \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

COPY files/recursor.conf /etc/powerdns/recursor.conf
COPY files/entry.sh /entry.sh

# According to DNS
EXPOSE 9573/tcp 9573/udp

ENTRYPOINT ["/entry.sh"]
CMD ["/usr/sbin/pdns_recursor"]
