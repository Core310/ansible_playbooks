# Server Default Ansible Playbook

This playbook sets up a headless server environment with applications and tools from the `personal_desktop` playbook.

## What it does

This playbook installs the following:

*   **Development Tools:** `python`, `pip`, `gh`, `nvm`, `node`, and `agy-cli`.
*   **Headless Applications:** `tailscale`.
*   **Common Tasks:** Docker, Bun.js, persistent tmux sessions, and unattended upgrades.

## Usage

The easiest way to run this playbook is using the provided wrapper script:

```bash
./run.sh
```

### Manual Execution
If you prefer to run it manually:

```bash
ansible-playbook -i inventory.ini main_script.yml
```
