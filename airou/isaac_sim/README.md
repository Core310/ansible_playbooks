# Robotics Isaac Sim & Lab Add-on

This standalone playbook sets up a robotics environment on Ubuntu 24.04 (Noble), featuring **NVIDIA Isaac Sim**, **Isaac Lab**, and isolated **ROS 2** environments.

## Features

- **Isaac Sim (Pip):** Installed via pip in a dedicated Python 3.10 virtual environment (`~/isaacsim_env`).
- **Isaac Lab (Source):** Cloned from GitHub to `~/IsaacLab`.
- **Isolated ROS 2:** Jazzy, Humble, and ZED environments running in Docker containers.
- **NVIDIA GPU Support:** Configures NVIDIA Container Toolkit for Docker.
- **Zsh Integration:** Adds aliases (`isaacsim`, `r2j`, `r2h`, `r2z`) and environment variables (`ISAACLAB_PATH`).

## Isolated ROS 2 Usage

ROS 2 is managed via Docker Compose in `~/robotics/docker-compose.yml`.

- **ROS 2 Jazzy:** `r2j [command]`
- **ROS 2 Humble:** `r2h [command]`
- **ZED ROS 2 (Jazzy):** `r2z [command]` (e.g., `r2z topic list`)

A shared volume is available at `~/robotics/shared` which is mapped to `/root/shared` inside the containers.

## Installation

Run the provided wrapper script:

```bash
./run.sh
```

### Manual Execution
```bash
ansible-playbook -i inventory.ini main_script.yml --ask-vault-pass -K
```

## Requirements

- NVIDIA GPU with latest drivers.
- Docker and NVIDIA Container Toolkit (installed by this playbook).
- Ubuntu 24.04 (Noble).
