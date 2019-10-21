#!/bin/sh

chown www-data:www-data /app -R

exec /usr/bin/dumb-init -cv "$@"
