# Project State: Workspace Restructuring Phase 2

## MILESTONE 1: Hardware Integration & Cleanup
### Phase 1: Workspace Cleanup
- [x] Remove CVAT playbook **(DONE)**
- [x] Remove ROS 2 Jazzy from `desktop` **(DONE)**
- [x] Remove ROS 2 Jazzy from `server` **(DONE)**
- [x] Streamline password prompts (remove -K and Vault requirement) **(DONE)**
- [x] Fix Docker check-mode path errors **(DONE)**

### Phase 2: ZED 2i Setup
- [x] Research: Confirm ZED SDK 5.3 compatibility with Ubuntu 24.04 **(DONE)**
- [x] Strategy: Implement Host+Docker hybrid setup **(DONE)**
- [x] Implementation: Create `airou/robotics/zed2i` playbook with SDK installer **(DONE)**
- [x] Bugfix: Correct udev rules URL (let installer handle it) **(DONE)**
- [x] Implementation: Integrate ZED ROS 2 wrapper into `airou/robotics/isaac_sim` docker-compose **(DONE)**

### Phase 3: Workspace Restructuring
- [x] Create category folders: `robotics`, `fresh`, `airou` **(DONE)**
- [x] Move background and gemini_rules to `app_backups` **(DONE)**
- [x] Move `robotics` under `airou` **(DONE)**
- [x] Update wallpaper directory paths in Desktop configs **(DONE)**
- [x] Update root README and `check_all.sh` with new structure **(DONE)**
- [x] Add Jetson Orin Nano flash playbook to `airou/jetson_flash` **(DONE)**
- [ ] Validation: Test camera connectivity and ROS 2 topic publishing **(TODO 1)**

## RESUME HERE
- **MILESTONE:** Hardware Integration & Cleanup
- **Phase:** ZED 2i Setup
- **Sub-phase:** Validation
- **Next Todo:** Validation: Test camera connectivity and ROS 2 topic publishing
