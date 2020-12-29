#!/usr/bin/env bash

pdns_ip=$(getent hosts pdns | awk '{ print $1 }')
sed "s/pdns/$pdns_ip/g" /etc/powerdns/zones.template > /etc/powerdns/zones.conf

/usr/bin/dumb-init -cv "$@"
