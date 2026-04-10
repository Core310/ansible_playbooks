#!/bin/bash
# Wrapper script to run the ansible playbook with the vault password prompt.
# Any additional arguments passed to this script will be passed to ansible-playbook.
ansible-playbook -i inventory.ini main_script.yml --ask-vault-pass -K "$@"
