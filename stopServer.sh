#!/usr/bin/env bash

export TF_LOG=INFO
export PATH=$PWD:$PATH

source localrc

#ansible-playbook -i inventory -u root ansible.yml

terraform  destroy
