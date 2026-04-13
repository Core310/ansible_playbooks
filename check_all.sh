#!/bin/bash
# Script to run a dry-run check on all playbooks in the repository.

# List of all playbook directories
playbooks=("personal_desktop" "server_default" "arcpro_default" "robotics_isaac_sim" "home_server")

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
        cd ..
    else
        echo "Warning: Directory $p not found, skipping."
    fi
done

echo ""
echo "===================================================="
echo "All checks completed."
echo "===================================================="
