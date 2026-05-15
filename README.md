# Ansible System Playbooks

A collection of Ansible playbooks for automating the setup of robotics workstations, headless servers, and specialized development environments on **Ubuntu 24.04 (Noble)**.

## 📂 Workspace Structure

### 🐕 [Airou](./airou)
*   **[ArcPro](./airou/arcpro):** Specialized setup for ArcPro hardware and campus networking.
*   **[Robotics](./airou/robotics):**
    *   **[Isaac Sim](./airou/robotics/isaac_sim):** Super station for NVIDIA Isaac Sim, Lab, and ROS 2 containers.
    *   **[ZED 2i](./airou/robotics/zed2i):** Host SDK and udev rules for Stereolabs cameras.

### 🍃 [Fresh](./fresh)
*   **[Desktop](./fresh/desktop):** Full graphical workstation with Hyprland and core dev tools.
*   **[Server](./fresh/server):** Lean, command-line only version of the workstation.
*   **[Docker](./fresh/docker):** Modular sync and management for core containers (Portainer, Beszel, etc.).

---

## 🚀 Quick Start

1.  **Install Ansible:**
    ```bash
    sudo apt update && sudo apt install -y ansible
    ```
2.  **Run a Playbook:**
    Navigate to a playbook directory and use the wrapper script:
    ```bash
    cd fresh/desktop && ./run.sh
    ```

## 🏁 Global Check
To verify the integrity of all playbooks:
```bash
./check_all.sh
```
