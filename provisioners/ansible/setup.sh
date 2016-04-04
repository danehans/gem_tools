#!/bin/bash

inventory=${INVENTORY:-inventory/gemini-master}
playbook=${PLAYBOOK:-playbooks/gemini-master.yml}

ansible-playbook -i ${inventory} ${playbook} $@
