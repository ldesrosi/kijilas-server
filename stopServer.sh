#!/usr/bin/env bash

source localrc.sh

export TF_LOG=INFO
export PATH=$PWD:$PATH
export SSH_FINGERPRINT=$(ssh-keygen -E md5 -lf $SSH_PUB | awk '{print $2}' | cut -c 4- )

ansible-playbook -i inventory -u steve deprovision.yml

terraform  destroy -auto-approve \
  -var "do_token=${DO_PAT}" \
  -var "pub_key=$SSH_PUB" \
  -var "pvt_key=$SSH_KEY" \
  -var "ssh_fingerprint=$SSH_FINGERPRINT" \
  -var "domain_name=$DOMAIN_NAME"
