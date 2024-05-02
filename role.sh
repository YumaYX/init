#!/bin/bash

awk '{print $0; if ($0 ~ /roles:/)exit}' ans_init.yml > .tmp.yml
echo "    - ${1}" >> .tmp.yml

make install
sudo -E ${HOME}/.local/bin/uv run ansible-playbook -i localhost, -c local .tmp.yml -c local
rm -f .tmp.yml
