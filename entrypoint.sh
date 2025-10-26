#!bin/bash

# Exit on error
set -e

# Start unbound in the background
/usr/sbin/unbound -c /etc/unbound/unbound.conf.d/pi-hole.conf &

# Start Pi-hole using its start script
exec /usr/bin/start.sh "$@"