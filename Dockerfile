# Based on the offical Pi-hole Docker image: https://github.com/pi-hole/docker-pi-hole/pkgs/container/pihole
FROM ghcr.io/pi-hole/pihole:2025.10.1

# Install Unbound
RUN apk add --no-cache unbound

# Copy Unbound config
COPY unbound.conf /etc/unbound/unbound.conf.d/pi-hole.conf

# Copy and run entrypoint script
COPY --chmod=0755 entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]