#!/bin/bash
# Wrapper script to setup the Jetson Orin Nano flash environment
ansible-playbook -i inventory.ini main_script.yml "$@"
