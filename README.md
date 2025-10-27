# Docker Pi-hole + Unbound

Super simple image that uses the base Pi-hole image and then installs Unbound on top of it.

- [Docker Pi-hole](https://github.com/pi-hole/docker-pi-hole/)
- [Unbound](https://github.com/NLnetLabs/unbound)

## Usage

1. Set up a Docker compose or use the [compose.yaml](/compose.yaml) provided (set your own timezone and password).
2. Then run `docker compose up -d` to start the container.

## Image

Use `docker pull ghcr.io/peterdev22/pihole-unbound:latest` if you would like to download the image manually.
