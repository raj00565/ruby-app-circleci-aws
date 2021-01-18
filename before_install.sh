#!/bin/bash

# Check for ansible tools, and attempt to install if not

apt update -y &> /dev/null
if [ $? != 0 ]; then
    apt install python3-pip -y
fi

pip3 list | grep -q ansible
if [ $? != 0 ]; then
    pip3 install ansible
fi
apt install build-essential -y
apt install curl -y
ansible-playbook /home/ubuntu/AnsibleScripts/site.yml -i /home/ubuntu/AnsibleScripts/hosts --connection=local

