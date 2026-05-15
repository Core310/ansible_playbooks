#!/bin/bash

# Simple wrapper to run the ZED 2i playbook
ansible-playbook -i inventory.ini main_script.yml -K "$@"
