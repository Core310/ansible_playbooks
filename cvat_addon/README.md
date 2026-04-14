# CVAT Add-on Playbook

This playbook automates the setup and deployment of CVAT (Computer Vision Annotation Tool).

## What it does

*   **Repository:** Clones the latest CVAT code from GitHub.
*   **Networking:** Automatically detects your **Tailscale IP** and sets it as the `CVAT_HOST`.
*   **Port Configuration:** Configures Traefik to use port **8093** instead of 8080.
*   **Storage:** Maps the `./tests/mounted_file_share` folder to `/home/django/share` for easy data access.
*   **Deployment:** Starts all CVAT services using Docker Compose.

## Usage

Run the following command from this directory:

```bash
./run.sh
```

### Accessing the UI (via Tailscale)

If you have **MagicDNS** enabled, you can access CVAT using your machine's hostname and your tailnet domain (`husky-bangus.ts.net`):

*   **CVAT UI:** `http://[hostname].husky-bangus.ts.net:8093`

*(Alternatively, you can always use the raw Tailscale IP displayed by the `tailscale ip` command).*

## Admin User Creation
After running the playbook, you must manually create your admin account:

```bash
docker exec -it cvat_server python3 manage.py createsuperuser
```
