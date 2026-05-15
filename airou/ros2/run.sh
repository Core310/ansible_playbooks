#!/bin/bash
# Wrapper script to run the ros2 docker setup
ansible-playbook -i inventory.ini main_script.yml "$@"
