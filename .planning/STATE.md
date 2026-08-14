# Project State: Comprehensive Workspace Overhaul

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
- [x] Move background and agy_rules to `app_backups` **(DONE)**
- [x] Move `robotics` under `airou` **(DONE)**
- [x] Update wallpaper directory paths in Desktop configs **(DONE)**
- [x] Update root README and `check_all.sh` with new structure **(DONE)**
- [x] Add Jetson Orin Nano flash playbook to `airou/jetson_flash` **(DONE)**

### Phase 4: Desktop Refinement
- [x] Install Firefox and LibreWolf browsers **(DONE)**
- [x] Ensure Thunderbird mail client is present **(DONE)**
- [x] Fix relative paths for all nested playbooks **(DONE)**
- [x] Verify all playbooks with successful global check **(DONE)**

## MILESTONE 2: Autonomous Driving & RL Refinement
### Active Issues & Telemetry
- [ ] **Motion / Driving Direction**: Vehicle is currently driving backwards during execution/training runs. Need to inspect motor command polarity / cmd_vel velocity mapping or RL reward penalty for backward velocity.
- [x] **Log Cleanup**: Removed old training and debug logs. **(DONE)**

## MILESTONE 3: FOSS Homelab Infrastructure
### Phase 5: Docker Container Standardization & Homelab Deployment
- [x] Convert Podman to native Docker & Docker Compose across all home_lab stacks. **(DONE)**
- [x] Create standalone `run.sh` entry points for all stacks (`anime`, `music`, `utility`, `pihole`). **(DONE)**
- [x] Centralize and relocate all Docker images and storage to 1.8 TB `D` drive (`/home/arika/D/docker`, `/home/arika/D/media`). **(DONE)**
- [x] Fix VERT build dependency conflict (upgraded `svelte-stripe` for Svelte 5 SSR compatibility, frozen lockfile). **(DONE)**
- [x] Deploy and verify Utility Stack (Portainer, Beszel Hub/Agent, BentoPDF, VERT). **(DONE)**

## MILESTONE 4: Automated Job Application Pipeline (ApplyPilot)
### Phase 6: CSV-Driven ApplyPilot Automation Stack
- [ ] Target Architecture: Create `home_lab/job_applier` Ansible stack.
- [ ] Implement `applypilot_runner.py` Python orchestrator for CSV batching (`jobs.csv` with status transitions).
- [ ] Create `plain_text_resume.yaml` master resume schema and `.env` secrets template.
- [ ] Build `site.yml` playbook with automated Python venv, Google Chrome / Playwright browser setup, and background service runner.

## PROJECT STATUS
Milestones 1 & 3 complete. Milestone 4 planned. Milestone 2 in progress.
