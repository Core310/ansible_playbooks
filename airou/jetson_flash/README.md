# Jetson Orin Nano Flash Setup

This playbook automates the preparation of the Linux for Tegra (L4T) environment for flashing a **Jetson Orin Nano** (NVMe) with JetPack 6.0 (L4T 36.3.0).

## What it does

1.  **Disk Space Check:** Ensures at least 15GB of free space is available.
2.  **Simultaneous Downloads:** Downloads the Driver Package and Sample Root FS in parallel to `~/jetson_reflash`.
3.  **Environment Extraction:** Unpacks the packages and sets up the `Linux_for_Tegra` directory.
4.  **Prerequisites & Binaries:** Runs NVIDIA's internal scripts to prepare the root filesystem.
5.  **Flash Script:** Creates a helper script `~/jetson_reflash/flash.sh`.

## Usage

1.  **Setup Environment:**
    ```bash
    ./run.sh
    ```
2.  **Trigger Force Recovery Mode:**
    - Short the REC and GND pins on the Jetson Orin Nano carrier board.
    - Power on the device.
    - Verify with `lsusb` that you see `0955:7523`.
3.  **Execute Flash:**
    ```bash
    cd ~/jetson_reflash
    ./flash.sh
    ```

## Flashing Flags Used
The `flash.sh` script is configured for:
- **Target:** Jetson Orin Nano (T234)
- **Storage:** External NVMe (`nvme0n1p1`)
- **BIOS/UEFI:** Also flashes the onboard QSPI.
