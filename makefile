PYTHON := python3
PIP    := pip3

ACTIVATE  := source venv/bin/activate
ANSIBLEPB := ansible-playbook -i localhost, -c local

default:
	@cat makefile | grep ^[a-z] | sort | sed 's/^/make /g;s/:.*//g'

all: install local test

install:
	$(PYTHON) -m venv venv
	$(ACTIVATE) && $(PIP) install --upgrade pip
	$(ACTIVATE) && $(PIP) install --no-cache-dir ansible

local: install
	$(ACTIVATE) && $(ANSIBLEPB) r.yml

test: install
	-mount -t nfs -o nfsvers=3 localhost:/nfs /mnt
	$(ACTIVATE) && $(ANSIBLEPB) serverspec.yml
	umount /mnt

pxe: install
	$(ACTIVATE) && $(ANSIBLEPB) pxe.yml

.PHONY: all local test pxe

update:
	git status
	sleep 5
	git add .
	git commit -am 'update'
