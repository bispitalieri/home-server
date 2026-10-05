# Infrastruttura Home Server 
[![English](https://img.shields.io/badge/🇬🇧_English-README-blue?style=for-the-badge)](README.md)

Una infrastruttura completa basata su Docker per un home server con molteplici servizi per networking, sicurezza, monitoraggio e hosting di applicazioni.

[![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)
[![Linux](https://img.shields.io/badge/Linux-FCC624?logo=linux&logoColor=black)](https://www.linux.org/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-F15833?logo=ubuntu&logoColor=white)](https://www.ubuntu.org/)
[![Raspberry Pi](https://img.shields.io/badge/Raspberry%20Pi-A22846?logo=raspberrypi&logoColor=white)](https://www.raspberrypi.com/)
[![Nginx Proxy Manager](https://img.shields.io/badge/Nginx%20Proxy%20Manager-C1A247?logo=nginx&logoColor=white)](https://nginxproxymanager.com/)

## Panoramica / Overview

Questo repository contiene una raccolta di configurazioni Docker Compose per un ambiente home server. Fornisce un'architettura modulare con servizi separati per vari scopi:

- **Networking**: Proxy, DNS e routing di rete
- **Sicurezza**: AdGuard, Cloudflare tunneling, Watchtower
- **Backup**: Sistema di backup automatizzato
- **Monitoraggio**: Netdata, metriche compatibili Prometheus
- **Applicazioni**: NextCloud, Immich, Mailpit, N8N, Portainer, Organizr, ecc.
- **Database**: MariaDB, Redis, PostgreSQL
- **Storage**: Volumi persistenti per la persistenza dei dati

## Servizi / Services

### Networking
- **proxy** - NGINX Proxy Manager per reverse proxying
- **cloudflare** - Servizio Cloudflare tunneling
- **docker-proxy** - Proxy socket Docker per accesso remoto
- **portainer** - UI gestione container
- **netdata** - Monitoraggio sistema in tempo reale

### Sicurezza / Security
- **adguardhome** - Filtraggio DNS e blocco pubblicità
- **watchtower** - Scansione vulnerabilità immagini e auto-aggiornamenti
- **vaultwarden** - Gestore password manager

### Applicazioni / Applications
- **nextcloud** - CMS NextCloud self-hosted
- **immich** - Galleria foto e gestione media
- **mailpit** - Elaborazione e gestione email
- **n8n** - Automazione workflow (basato su Node-RED)
- **portainer** - UI orchestrazione container
- **organizr** - Piattaforma organizzazione e collaborazione
- **olivetin** - Applicazione personalizzata per lanciare comandi e script
- **dozzle** - Servizio monitoraggio container
- **uptime-kuma** - Monitoraggio uptime
- **backup-system** - Soluzione backup automatizzata

### Database / Databases
- **proxy-db** - Database MariaDB per applicazioni
- **redis** - Servizio caching e coda Redis
- **postgres** - Database PostgreSQL per NextCloud

## Avvio Rapido / Quick Start

```bash
# Clona il repository
git clone https://github.com/bispitalieri/home-server.git
cd home-server

# Avvia tutti i servizi
docker-compose -f docker-compose.yml up -d

# Visualizza i log
docker-compose -f docker-compose.yml logs -f
```

## Configurazione / Configuration

Ogni servizio ha il proprio file `.env` per la configurazione. Sostituisci i valori placeholder con le tue credenziali e impostazioni reali.

## Monitoraggio / Monitoring

- **Netdata** - Metriche sistema in tempo reale (CPU, memoria, disco, rete)
- **Portainer** - GUI per gestione container
- **NextCloud** - Interfaccia web su http://localhost:8080
- **Immich** - Galleria media su http://localhost:8080

## Licenza / License

MIT