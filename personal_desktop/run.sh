#!/bin/bash
# Wrapper script to run the ansible playbook with the vault password prompt.

# Check if ansible-playbook is installed
if ! command -v ansible-playbook &> /dev/null; then
    echo "Error: ansible-playbook could not be found."
    echo "Please install Ansible by running: sudo apt update && sudo apt install -y ansible"
    exit 1
fi

# Any additional arguments passed to this script will be passed to ansible-playbook.
ansible-playbook -i inventory.ini main_script.yml --ask-vault-pass -K "$@"
