# Isolated ROS 2 Environments (Docker)

This playbook sets up isolated **ROS 2** environments using Docker Compose.

## Features

- **ROS 2 Jazzy:** `r2j [command]`
- **ROS 2 Humble:** `r2h [command]`
- **ZED ROS 2 (Jazzy):** `r2z [command]`
- **NVIDIA GPU Support:** Configured for hardware acceleration.
- **Shared Volume:** Available at `~/robotics/shared` (mapped to `/root/shared`).

## Usage

Run the provided wrapper script:

```bash
./run.sh
```

### Manual Execution
```bash
ansible-playbook -i inventory.ini main_script.yml -K
```
