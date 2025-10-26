#!/bin/bash

# Exit on error
set -e

# Start unbound in the background
echo "Starting unbound"
/usr/sbin/unbound -c /etc/unbound/unbound.conf.d/pi-hole.conf &

# Wait for unbound to start working
wait_for=20
timeout_at=$((SECONDS+wait_for))

while ! dig @127.0.0.1 -p 5335 pi-hole.net >/dev/null 2>&1; do
    sleep 0.1
    if [ $SECONDS -ge $timeout_at ]; then
        echo "Unbound did not start"
        exit 1
    fi
done

echo "Unbound has started"

# Start Pi-hole using its start script
exec /usr/bin/start.sh "$@"