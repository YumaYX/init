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

dnf -y install python3.11-pip git

if [ -e /tmp/init ]; then
  mv -v /tmp/init /tmp/init.bak$$$(date +%Y%m%d%H%M%S)
fi

git clone https://github.com/YumaYX/init.git /tmp/init \
    && cd /tmp/init \
    && python3.11 -m pip install -r requirements.txt \
    && /usr/local/bin/ansible-playbook -i hosts r.yml -c local \
    && /usr/local/bin/ansible-playbook -i hosts serverspec.yml -c local

mv -v /tmp/init /tmp/init.bak$$$(date +%Y%m%d%H%M%S)

