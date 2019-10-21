FROM majid7221/python:3

RUN set -ex \
    && apt-get update \
    # lib for building mysql db driver
    && apt-get install -y --no-install-recommends \
        default-libmysqlclient-dev \
        # lib for buiding ldap and ssl-based application
        libsasl2-dev libldap2-dev libssl-dev \
        # lib for building python3-saml
        libxml2-dev libxslt1-dev libxmlsec1-dev libffi-dev pkg-config \
        # supervisor
        supervisor \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

ENV BRANCH master
ENV LC_ALL=C.UTF-8 LANG=C.UTF-8
# clone repo
RUN set -ex \
    && git clone https://github.com/ngoduykhanh/PowerDNS-Admin.git --depth 1 -b $BRANCH app

WORKDIR /app

RUN set -ex \
    && pip3 install -r requirements.txt \
    && sed -i "s/directory=\/powerdns-admin/directory=\./g" ./supervisord.conf \
    && cp supervisord.conf /etc/supervisord.conf \
    && cp configs/development.py config.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
