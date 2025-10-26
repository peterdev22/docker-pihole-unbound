#!/bin/bash

# Exit on error
set -e

# Start Unbound
echo "  [i] Starting Unbound"
/usr/sbin/unbound -c /etc/unbound/unbound.conf.d/pi-hole.conf &

# Wait for Unbound to start working
wait_for=20
timeout_at=$((SECONDS+wait_for))

while ! dig @127.0.0.1 -p 5335 pi-hole.net >/dev/null 2>&1; do
    sleep 0.1
    if [ $SECONDS -ge $timeout_at ]; then
        echo "  [✗] Unbound did not start - stopping container"
        exit 1
    fi
done

echo "  [i] Unbound has started"

# Start Pi-hole using the start.sh script from its image
exec /usr/bin/start.sh "$@"