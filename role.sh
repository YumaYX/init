#!/bin/bash

awk '{print $0; if ($0 ~ /roles:/)exit}' r.yml > .r.yml
echo "    - ${1}" >> .r.yml

make install
source venv/bin/activate && ansible-playbook -v -i localhost, .r.yml -c local
rm -f .r.yml
