# Personal Desktop Ansible Playbook

This playbook sets up a personalized desktop environment on Ubuntu 24.04 (Noble).

## What it does

This playbook installs the following:

*   **Desktop Environment:** Hyprland with Waybar and custom dots.
*   **ROS 2 Jazzy:** Robot Operating System environment.
*   **Development Tools:** Python, Node.js, GitHub CLI, Gemini CLI.
*   **Applications:** Discord, Obsidian, Steam, Tailscale, JetBrains Toolbox, and more.
*   **Common Tasks:** Docker, Bun.js, persistent tmux sessions, and unattended upgrades.

## Usage

The easiest way to run this playbook is using the provided wrapper script, which handles the Ansible Vault password prompt:

```bash
./run.sh
```

### Manual Execution
If you prefer to run it manually, you must provide the vault password and the become (sudo) password:

```bash
ansible-playbook -i inventory.ini main_script.yml --ask-vault-pass -K
```
