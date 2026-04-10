# ArcPro Default Ansible Playbook

This playbook sets up a development environment for ArcPro robots.

## What it does

This playbook installs the following:

*   **Users:** Creates `arc` and `airou` accounts.
*   **Networking:** Configures Wi-Fi with WPA2-EAP via Netplan.
*   **Software:** ROS 2, flatpak, VESC Tool, GitHub CLI, and Tailscale.
*   **Repository:** Clones and sets up the `arcpro_system` repository.

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
