#!/bin/bash
ansible-playbook -i hosts $@ upgrade.yml -e "ansible_python_interpreter=/usr/bin/python3" --tags "upgrade"