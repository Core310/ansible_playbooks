# ZED 2i SDK & Environment Setup

This playbook installs the **ZED SDK** and configures the host system for Stereolabs ZED cameras on Ubuntu 24.04 (Noble).

## Features

- **ZED SDK (v5.3):** Automated installation using the official `.run` installer with the `--silent` flag.
- **Udev Rules:** Deploys `99-sl-zed.rules` to enable non-root access to the camera hardware.
- **Dependencies:** Ensures `zstd` is installed for installer extraction.

## Usage

Run the provided wrapper script:

```bash
./run.sh
```

### Manual Execution
```bash
ansible-playbook -i inventory.ini main_script.yml -K
```

## Integration with Docker

The ZED SDK on the host provides the necessary drivers and udev rules. You can then run ZED-enabled ROS 2 containers (like the one in `robotics_isaac_sim`) and they will have access to the hardware.

## Requirements

- **NVIDIA GPU:** With latest drivers installed (required for ZED SDK).
- **Ubuntu 24.04 (Noble).**
- **Sudo Access:** Required for SDK installation and udev rule deployment.
