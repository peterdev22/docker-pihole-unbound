# Uses the offical pi-hole image as the base
# https://github.com/pi-hole/docker-pi-hole/pkgs/container/pihole
FROM ghcr.io/pi-hole/pihole:latest

# Command-line args
ARG BUILD_DATE
ARG GIT_SHA

# Labels for GHCR
LABEL org.opencontainers.image.source=https://github.com/peterdev22/docker-pihole-unbound
LABEL org.opencontainers.image.description="Pi-hole and unbound in a Docker container"
LABEL org.opencontainers.image.licenses=MIT
# Labels to overwrite base image for accuracy
LABEL org.opencontainers.image.title="docker-pihole-unbound"
LABEL org.opencontainers.image.url=https://github.com/peterdev22/docker-pihole-unbound
LABEL org.opencontainers.image.created=${BUILD_DATE}
LABEL org.opencontainers.image.revision=${GIT_SHA}

# Install unbound
RUN apk add --no-cache unbound

# Copy unbound config
COPY unbound.conf /etc/unbound/unbound.conf.d/pi-hole.conf

# Copy and run entrypoint script
COPY --chmod=0755 entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]