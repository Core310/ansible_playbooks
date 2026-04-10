# Server Default Ansible Playbook

This playbook sets up a headless server environment with applications and tools from the `personal_desktop` playbook.

## What it does

This playbook installs the following:

*   **ROS 2 Jazzy:** The Robot Operating System.
*   **Development Tools:** `python`, `pip`, `gh`, `nvm`, `node`, and `gemini-chat-cli`.
*   **Headless Applications:** `tailscale`.

## Usage

To run the playbook, execute the following command:

```bash
ansible-playbook main_script.yml
```
