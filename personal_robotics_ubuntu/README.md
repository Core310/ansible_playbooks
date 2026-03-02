# Personal Robotics Ubuntu Setup

## 🚀 Getting Started
To run the setup on your local machine, use the following command:

```bash
ansible-playbook main_script.yml -K
```

## 📂 Dotfiles & Customizations
- **Hyprland Dots**: Your existing dots in `~/Hyprland-Dots` are automatically symlinked to `~/.config`.
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
