#!/bin/bash

awk '{print $0; if ($0 ~ /roles:/)exit}' r.yml > .r.yml
echo "    - ${1}" >> .r.yml

make install
/root/.local/bin/uv run ansible-playbook -i localhost, -c local .r.yml -c local
rm -f .r.yml
