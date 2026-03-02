# Personal Robotics Ubuntu Setup

## 🚀 Getting Started (Fresh Install)
On a new Ubuntu 24.04 instance, follow these steps:

1. **Install Prerequisites**:
   ```bash
   sudo apt update && sudo apt install -y ansible git
   ```

2. **Clone this Setup Repository**:
   ```bash
   git clone https://github.com/Core310/ansible_playbooks.git
   cd personal_robotics_ubuntu
   ```

3. **Run the Playbook**:
   ```bash
   ansible-playbook main_script.yml -K
   ```

## 📂 Dotfiles & Customizations
- **Dotfiles**: This playbook automatically clones your `Hyprland-Dots` repo into `~/Hyprland-Dots`.
- **Installer**: The `LinuxBeginnings/Ubuntu-Hyprland` (v24.04) repository is cloned temporarily into `/tmp/hyprland-installer` to execute the system-wide setup.
- **Hyprland Dots**: Your configuration folders are then symlinked to `~/.config` from `~/Hyprland-Dots`.
  - **Backups**: If a real directory already exists in `~/.config`, it is renamed to `.bak` (e.g., `~/.config/hypr.bak`) before symlinking.
- **Wallpapers**: 
  - Source: `/home/arika/Documents/ansible_playbooks/background`
  - The `wallDIR` variable is configured in both your shell and Hyprland environment to point here.

# Post-Installation & Login Checklist

After running the Ansible playbook, you will need to manually log into or configure the following services.

## 🔐 Accounts to Log In
- **GitHub CLI (`gh`)**:
  - Run `gh auth login` in your terminal to authenticate.
- **Discord / Vencord**:
  - Open Discord and log in. Vencord should load automatically if the installation script was successful.
- **JetBrains Toolbox**:
  - Launch from your application menu and log into your JetBrains account to sync your IDEs and licenses.
- **Tailscale**:
  - Run `sudo tailscale up` to authenticate this machine into your tailnet.
- **Obsidian**:
  - Log in if using Obsidian Sync.
- **Telegram Desktop**:
  - Authenticate via QR code or phone number.
- **Todoist**:
  - Log in to sync your tasks.
- **Steam**:
  - Log in to access your game library.
- **Thunderbird / Calendar**:
  - Set up your email accounts and sync your online calendars (Google, Outlook, CalDAV).

## 🛠️ Manual Installations
- **DaVinci Resolve**:
  - **Status**: Not automated due to Blackmagic's registration form.
  - **Action**: Download the Linux `.zip` from the [Blackmagic Design Support](https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion) page.
  - **Setup**: Extract and run the `.run` installer located in your `~/Downloads` folder.

## ⚙️ Environment Notes
- **ROS 2 Jazzy**: Remember to source your environment: `source /opt/ros/jazzy/setup.zsh` (or bash).
- **NVM / Node**: If `npm` or `node` are not immediately available after the first run, restart your shell or run `source ~/.nvm/nvm.sh`.
