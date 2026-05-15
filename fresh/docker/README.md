# Home Server Docker Sync Playbook

This playbook acts as a modular add-on to sync and download your core Docker images.

## What it does

*   **Docker Setup:** Ensures Docker is installed and the NVIDIA Container Toolkit is configured (via the common docker task).
*   **Image Sync:** Pulls the latest versions of your core images:
    *   Beszel (Agent & Hub)
    *   Portainer
    *   BentoPDF
*   **Manual Build:** Clones and builds **VERT** from source with your specific build arguments.

## Usage

This is designed to be run on an existing profile. It will use the `arika` user variables.

```bash
./run.sh
```

## Accessing Services (via Tailscale)

If you have **MagicDNS** enabled, you can access your services using your machine's hostname and your tailnet domain (`husky-bangus.ts.net`):

*   **Beszel (Monitoring):** `http://[hostname].husky-bangus.ts.net:8090`
*   **Portainer:** `http://[hostname].husky-bangus.ts.net:9000`
*   **VERT:** `http://[hostname].husky-bangus.ts.net:3000`
