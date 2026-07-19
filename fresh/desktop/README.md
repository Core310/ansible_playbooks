# Personal Desktop Ansible Playbook

This playbook sets up a personalized desktop environment on Ubuntu 24.04 (Noble).

## What it does

This playbook installs the following:

*   **Desktop Environment:** Hyprland with Waybar and custom dots.
*   **Development Tools:** Python, Node.js, GitHub CLI, AGY CLI.
*   **Applications:** Discord, Obsidian, Steam, Tailscale, JetBrains Toolbox, and more.
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
