# ArcPro Default Ansible Playbook

This playbook sets up a development environment for ArcPro. It uses the `linux-arcpro` role from the main `ansible` directory to perform the initial setup of the machine, including user creation, network configuration, and installation of some basic tools.

## How it works

The main playbook `main_script.yml` is configured to run on `localhost`. It executes the following steps:

1.  **Applies the `linux-arcpro` role:** This role is located in `../ansible/roles/linux-arcpro`. It performs the following actions:
    *   Creates two users: `arc` and `airou`.
    *   Sets up networking using `netplan`.
    *   Installs `flatpak` and the VESC Tool.
    *   Clones the `arcpro_system` repository for the `airou` user.
    *   Configures `rosdep` for the `arcpro_system` repository.
    *   Adds the users to hardware access groups.

2.  **Installs ROS2:** It includes the `tasks/ros2.yml` playbook to install ROS2.

3.  **Installs miscellaneous tools:** It includes the `tasks/misc_tools.yml` playbook to install other tools like GitHub CLI and Tailscale.

## Configuration

The playbook uses variables to configure the setup. These variables are defined in the `vars` section of `main_script.yml`:

*   `wifi_interface`: The name of the wifi interface (e.g., `wlo1`).
*   `wifi_domain`: The domain for the wifi connection.
*   `wifi_ssid`: The SSID of the wifi network.
*   `wifi_username`: The username for the wifi network.
*   `arc_password`: The password for the `arc` user. **You must change this before running the playbook.**
*   `airou_password`: The password for the `airou` user. **You must change this before running the playbook.**

## Usage

Before running the playbook, you must update the passwords for the `arc` and `airou` users in `main_script.yml`.

To run the playbook, execute the following command:

```bash
ansible-playbook main_script.yml
```

## TODO

- **Implement Ansible Vault:** The passwords in `main_script.yml` are stored in plain text. For better security, they should be encrypted using Ansible Vault.

This will configure the local machine according to the playbook and role definitions.
