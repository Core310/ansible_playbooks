# Ansible System Playbooks

A collection of Ansible playbooks for automating the setup of robotics workstations, headless servers, and specialized development environments on **Ubuntu 24.04 (Noble)**.

---

## 📂 Workspace Structure

### 🐕 [Airou](./airou)
*   **[ROS 2](./airou/ros2):** Isolated Docker environments for robotics.
    *   **Includes:** ROS 2 Jazzy (Desktop), ROS 2 Humble (Desktop), and ZED ROS 2 (Jazzy) containers.
    *   **Features:** Hardware acceleration, shared host volumes, and `r2j`/`r2h`/`r2z` shell aliases.
*   **[Isaac Sim](./airou/isaac_sim):** Super station for NVIDIA simulation.
    *   **Includes:** NVIDIA Isaac Sim (via pip), Isaac Lab (from source), and NVIDIA Container Toolkit.
    *   **Features:** Python 3.10 venv management and `isaacsim` shell alias.
*   **[ZED 2i](./airou/zed2i):** Host-side SDK for Stereolabs cameras.
    *   **Includes:** ZED SDK v5.3 (silent install) and official udev rules.
*   **[ArcPro](./airou/arcpro):** Specialized hardware and networking setup.
    *   **Includes:** `arc` and `airou` users, Enterprise Wi-Fi (Netplan), VESC Tool, and Tailscale.
*   **[Jetson Flash](./airou/jetson_flash):** Automated preparation for Jetson Orin Nano.
    *   **Includes:** L4T Driver Package & RootFS downloads and a standalone `flash.sh` script for NVMe.

### 🍃 [Fresh](./fresh)
*   **[Desktop](./fresh/desktop):** Full graphical workstation setup.
    *   **Includes:** Hyprland (Waybar/Dots), Oh My Zsh (Custom theme), Docker, Bun.js, Python, Node.js (NVM), AGI CLI.
    *   **Browsers:** Firefox, LibreWolf.
    *   **Apps:** Discord (Vencord), Obsidian, Telegram, Todoist, Zotero, Steam, JetBrains Toolbox.
*   **[Server](./fresh/server):** Lean, command-line only version of the desktop.
    *   **Includes:** Everything in Desktop *except* graphical apps and Hyprland.
    *   **Features:** Oh My Zsh, Pokemon-colorscripts, Fastfetch, Tmux (TPM), and Tailscale.
*   **[Docker](./fresh/docker):** Modular infrastructure sync.
    *   **Includes:** Beszel (Hub/Agent), Portainer, BentoPDF, and VERT (built from source).

---

## 🛠️ Shared Features (Common Tasks)

All playbooks automatically apply these standards:
*   **Dynamic User:** All tasks target the current system user (`$USER`) for maximum portability.
*   **Passwordless Sudo:** Configures your user for `NOPASSWD: ALL` (applies to **all** playbooks, including Server).
*   **Shell Experience:** Oh My Zsh with the `agnosterzak` theme and `zsh-syntax-highlighting`.

---

## 🚀 Quick Start

1.  **Install Ansible:**
    ```bash
    sudo apt update && sudo apt install -y ansible
    ```
2.  **Run a Playbook (e.g., Desktop):**
    ```bash
    cd fresh/desktop && ./run.sh -K
    ```
    *(Note: Use `-K` only for the very first run to provide your sudo password. Subsequent runs will be passwordless.)*

## 🏁 Global Check
To verify the integrity of all playbooks without making changes:
```bash
./check_all.sh
```
