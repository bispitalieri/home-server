# Home Server Infrastructure 
[![Italiano](https://img.shields.io/badge/🇮🇹_Italiano-README-blue?style=for-the-badge)](README.it.md)

A comprehensive Docker-based home server infrastructure with multiple services for networking, security, monitoring, and application hosting.

[![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)
[![Linux](https://img.shields.io/badge/Linux-FCC624?logo=linux&logoColor=black)](https://www.linux.org/)
[![Raspberry Pi](https://img.shields.io/badge/Raspberry%20Pi-A22846?logo=raspberrypi&logoColor=white)](https://www.raspberrypi.com/)
[![Nginx Proxy Manager](https://img.shields.io/badge/Nginx%20Proxy%20Manager-F15833?logo=nginx&logoColor=white)](https://nginxproxymanager.com/)
## Overview

This repository contains a collection of Docker Compose configurations for a home server environment. It provides a modular architecture with separate services for various purposes:

- **Networking**: Proxy, DNS, and network routing
- **Security**: AdGuard, Cloudflare tunneling, Watchtower
- **Backup**: Automated backup system
- **Monitoring**: Netdata, Prometheus-compatible metrics
- **Applications**: NextCloud, Immich, Mailpit, N8N, Portainer, Organizr, etc.
- **Databases**: MariaDB, Redis, PostgreSQL
- **Storage**: Persistent volumes for data persistence

## Services

### Networking
- **proxy** - NGINX Proxy Manager for reverse proxying
- **cloudflare** - Cloudflare tunneling service
- **docker-proxy** - Docker socket proxy for remote access
- **portainer** - Container management UI
- **netdata** - Real-time system monitoring

### Security
- **adguardhome** - DNS filtering and ad-blocking
- **watchtower** - Image vulnerability scanning and auto-updates
- **vaultwarden** - Secret management (HashiCorp Vault alternative)

### Applications
- **nextcloud** - Self-hosted NextCloud CMS
- **immich** - Photo gallery and media management
- **mailpit** - Email processing and management
- **n8n** - Workflow automation (Node-RED based)
- **portainer** - Container orchestration UI
- **organizr** - Organization and collaboration platform
- **olivetin** - Custom application
- **dozzle** - Container monitoring service
- **uptime-kuma** - Uptime monitoring
- **backup-system** - Automated backup solution

### Databases
- **proxy-db** - MariaDB database for applications
- **redis** - Redis caching and queue service
- **postgres** - PostgreSQL database for NextCloud

## Quick Start

```bash
# Clone the repository
git clone https://github.com/your-username/home-server-infra.git
cd home-server-infra

# Start all services
docker-compose -f docker-compose.yml up -d

# View logs
docker-compose -f docker-compose.yml logs -f
```

## Configuration

Each service has its own `.env` file for configuration. Replace placeholder values with your actual credentials and settings.

## Monitoring

- **Netdata** - Real-time system metrics (CPU, memory, disk, network)
- **Portainer** - GUI for managing containers
- **NextCloud** - Web interface at http://localhost:8080
- **Immich** - Media gallery at http://localhost:8080

## License

MIT