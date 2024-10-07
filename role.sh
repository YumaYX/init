#!/bin/bash

cat << EOF > .r.yml
- hosts: all
  vars:
    prime_user: yuma
    ruby_version: 3.3.5
  roles:
    - ${1}
EOF

make install
source venv/bin/activate && ansible-playbook -v -i localhost, .r.yml -c local
rm -f .r.yml
