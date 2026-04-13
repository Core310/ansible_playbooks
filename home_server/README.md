# Home Server Docker Sync Playbook

This playbook acts as a modular add-on to sync and download your core Docker images.

## What it does

*   **Docker Setup:** Ensures Docker is installed and the NVIDIA Container Toolkit is configured (via the common docker task).
*   **Image Sync:** Pulls the latest versions of your core images:
    *   Beszel (Agent & Hub)
    *   Portainer
    *   BentoPDF
    *   VERT

## Usage

This is designed to be run on an existing profile. It will use the `arika` user variables.

```bash
./run.sh
```
