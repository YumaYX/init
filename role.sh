#!/bin/bash

cat << EOF > .r.yml
- hosts: all
  roles:
    - ${1}
EOF
source venv/bin/activate && ansible-playbook -i hosts .r.yml -c local
rm -f .r.yml
