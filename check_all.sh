#!/bin/bash
# Script to run a dry-run check on all playbooks in the repository.

# Check if ansible-playbook is installed
if ! command -v ansible-playbook &> /dev/null; then
    echo "Error: ansible-playbook could not be found."
    echo "Please install Ansible by running: sudo apt update && sudo apt install -y ansible"
    exit 1
fi

# List of all playbook directories
playbooks=(
    "fresh/desktop"
    "fresh/server"
    "fresh/docker"
    "airou/robotics/isaac_sim"
    "airou/robotics/zed2i"
    "airou/arcpro"
    "airou/jetson_flash"
)

echo "===================================================="
echo "Starting global check for all playbooks"
echo "===================================================="

for p in "${playbooks[@]}"; do
    if [ -d "$p" ]; then
        echo ""
        echo ">>> Checking Playbook: $p"
        echo "----------------------------------------------------"
        cd "$p"
        ./run.sh --check
        cd - > /dev/null
    else
        echo "Warning: Directory $p not found, skipping."
    fi
done

echo ""
echo "===================================================="
echo "All checks completed."
echo "===================================================="
