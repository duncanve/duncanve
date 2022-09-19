#!/bin/bash 
sudo apt install ansible screen 
ansible-galaxy collection install ansible.posix community.general
ansible-playbook -i "localhost" installer_expert.yml -bK 
