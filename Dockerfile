FROM ghcr.io/pi-hole/pihole:2025.10.0
RUN apk add --no-cache unbound

COPY unbound.conf /etc/unbound/unbound.conf.d/pi-hole.conf
RUN mkdir -p /etc/services.d/unbound

COPY --chmod=0755 entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]