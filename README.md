# ansible_playbooks
Playbooks for various system setups!

## personal_robotics_ubuntu
A comprehensive setup for a robotics workstation on Ubuntu (Noble).

### Key Features:
- **Dotfiles Sync:** Clones and symlinks [JaKooLit's Hyprland-Dots](https://github.com/JaKooLit/Hyprland-Dots).
- **Customization:**
  - **Waybar Transparency:** Automatically forces the "Crystal Clear" transparent style.
  - **Custom Shell Config:** Sources `hypr_custom.zsh` for custom environment variables like `wallDIR`.
- **ROS 2 Jazzy:** Automates the environment setup for ROS 2.
- **Hardware Support:** Configured for NVIDIA GPUs by default.
- **Development Tools:** Installs essential apps and dev tools.
