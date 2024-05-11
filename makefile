PYTHON := python3
PIP    := pip3

ACTIVATE  := source venv/bin/activate
ANSIBLEPB := ansible-playbook -i hosts -c local

default:
	@cat makefile | grep ^[a-z] | sort | sed 's/^/make /g;s/:.*//g'

all: install local serverspec

install:
	$(PYTHON) -m venv venv
	$(ACTIVATE) && $(PIP) install --upgrade pip
	$(ACTIVATE) && $(PIP) install --no-cache-dir ansible

update:
	git status
	sleep 5
	git add .
	git commit -am 'update'

local: install
	$(ACTIVATE) && $(ANSIBLEPB) r.yml

serverspec: install
	$(ACTIVATE) && $(ANSIBLEPB) serverspec.yml

pxe: install
	$(ACTIVATE) && $(ANSIBLEPB) pxe.yml

.PHONY: all local serverspec pxe

