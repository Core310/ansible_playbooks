# Robotics Isaac Sim & Lab Ansible Playbook

This playbook sets up a powerful robotics workstation on Ubuntu 24.04 (Noble), specifically configured for **NVIDIA Isaac Sim** and **Isaac Lab**.

## What it does

This playbook includes everything from the `personal_desktop` playbook, plus:

*   **NVIDIA Container Toolkit:** Configures Docker to access your GPU.
*   **Isaac Sim:** Automatically installs the `isaacsim` package via pip from the NVIDIA index.
*   **Isaac Lab:** Clones the Isaac Lab repository and sets up the environment.
*   **Python:** Explicitly ensures `python3-venv` and `python3-pip` are installed.
*   **Environment Variables:** Automatically configures `ISAACLAB_PATH` in your Zsh profile.

## Usage

The easiest way to run this playbook is using the provided wrapper script:

```bash
./run.sh
```

### Manual Execution
```bash
ansible-playbook -i inventory.ini main_script.yml --ask-vault-pass -K
```
