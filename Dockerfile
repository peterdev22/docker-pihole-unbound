# Uses the offical pi-hole image as the base
# https://github.com/pi-hole/docker-pi-hole/pkgs/container/pihole
FROM ghcr.io/pi-hole/pihole:2025.10.0

# Labels for GHCR
LABEL org.opencontainers.image.source=https://github.com/peterdev22/docker-pihole-unbound
LABEL org.opencontainers.image.description="Pi-hole and unbound in a Docker container"
LABEL org.opencontainers.image.licenses=MIT

# Install unbound
RUN apk add --no-cache unbound

# Copy unbound config
COPY unbound.conf /etc/unbound/unbound.conf.d/pi-hole.conf

# Copy and run entrypoint script
COPY --chmod=0755 entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]