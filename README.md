# Ansible System Playbooks

A collection of Ansible playbooks for automating the setup of robotics workstations, headless servers, and specialized development environments on **Ubuntu 24.04 (Noble)**.

## 🚀 Quick Start

1.  **Install Ansible:**
    ```bash
    sudo apt update && sudo apt install -y ansible
    ```
2.  **Clone this Repository:**
    ```bash
    git clone https://github.com/Core310/ansible_playbooks.git
    cd ansible_playbooks
    ```
3.  **Run a Playbook:**
    Navigate to any playbook directory and use the wrapper script:
    ```bash
    ./run.sh
    ```

---

## 📂 Playbook Overviews

### 1. [Personal Desktop](./personal_desktop)
**Goal:** Sets up a full graphical robotics workstation for the user `arika`.
*   **Desktop:** Hyprland, Waybar, custom Dotfiles (JaKooLit), and Fastfetch.
*   **Shell:** Zsh with Oh My Zsh (Agnosterzak theme), syntax highlighting, and custom ROS 2 aliases.
*   **Software:** ROS 2 Jazzy, Docker (GPU support), Discord, Steam, Obsidian, Tailscale, JetBrains Toolbox.

### 2. [Headless Server](./server_default)
**Goal:** A lean, command-line only version of the personal desktop.
*   **Core:** ROS 2 Jazzy, Python 3, Docker, Tailscale.
*   **Shell:** Same Zsh environment and aliases as the desktop, but without graphical dependencies.
*   **Convenience:** Tmux with persistent sessions and passwordless sudo.

### 3. [Robotics Isaac Sim](./robotics_isaac_sim)
**Goal:** A "Super Station" optimized specifically for NVIDIA Isaac Sim and Isaac Lab.
*   **Includes everything in the Personal Desktop.**
*   **Isaac Sim:** Automated installation of Isaac Sim via pip and Isaac Lab from source.
*   **Hardware:** Configures the NVIDIA Container Toolkit for GPU-accelerated Docker containers.

### 4. [Personal Docker Containers](./personal_docker_containers)
**Goal:** A modular "Add-on" playbook to sync and manage your Docker infrastructure.
*   **Docker Sync & Launch:** Automatically pulls, updates, and launches core containers:
    *   **Portainer:** Management UI on custom port **8447**.
    *   **Beszel:** Monitoring Hub and Agent.
    *   **BentoPDF & VERT** (built from source).

### 5. [ArcPro Robot](./arcpro_default)
**Goal:** Specialized setup for ArcPro robotics hardware.
*   **Users:** Creates and configures the `arc` and `airou` system accounts.
*   **Networking:** Configures enterprise Wi-Fi (WPA2-EAP) using Netplan.
*   **Robotics:** ROS 2 Jazzy, VESC Tool, and arcpro_system repository setup.
## 🛠️ Common Tasks (Shared Logic)
All playbooks share a library of common, verified tasks located in `common_tasks/`:
*   **Docker:** Modern engine install with NVIDIA GPU support.
*   **Zsh Extras:** Oh My Zsh, custom themes, and Pokemon-colorscripts.
*   **Security:** Passwordless sudo and **Ansible Vault** encryption for all secrets.
*   **Dev Tools:** Bun.js, Node.js (NVM), Python 3 Venv, and GitHub CLI.

---

## 🔐 Security
All passwords and sensitive data are encrypted using **Ansible Vault**. 
*   To run any playbook, you will be prompted for your **Vault Password** first, then your **sudo (BECOME) password**.
*   The `run.sh` script in each directory handles these prompts for you.

## 🏁 Global Check
To verify the integrity of all playbooks at once, run the script in the root directory:
```bash
./check_all.sh
```
