#!/usr/bin/env bash

if [ ! -f /etc/redhat-release ]; then
    echo "terminated." 1>&2
    exit 1
fi

if [ $(id -u) -ne 0 ]; then
  echo "run as root" 1>&2
  echo "terminated." 1>&2
  exit 1
fi

dnf -y install python3.11-pip git pip

git clone https://github.com/YumaYX/init.git /tmp/init \
    && cd /tmp/init \
    && python3.11 -m pip install -r requirements.txt \
    && ansible-playbook -i hosts r.yml -c local
