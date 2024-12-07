PYTHON := python3
PIP    := pip3

ACTIVATE  := source venv/bin/activate
ANSIBLEPB := LANG=C ansible-playbook -i localhost, -c local

default:
	@cat makefile | grep ^[a-z] | sort | sed 's/^/make /g;s/:.*//g'

all: install local

install:
	$(PYTHON) -m venv venv
	$(ACTIVATE) && $(PIP) install --upgrade pip
	$(ACTIVATE) && $(PIP) install --no-cache-dir -r requirements.txt

lint: dev
	$(ACTIVATE) && ansible-lint

lintfix: dev
	$(ACTIVATE) && ansible-lint --fix

dev:
	$(ACTIVATE) && $(PIP) install ansible-lint

local: install
	$(ACTIVATE) && $(ANSIBLEPB) r.yml

test: install
	$(ACTIVATE) && $(ANSIBLEPB) serverspec.yml

pxe: install
	$(ACTIVATE) && $(ANSIBLEPB) pxe.yml

.PHONY: all local test pxe

clean:
	rm -rf venv
	vagrant destroy -f

update:
	git status
	sleep 5
	git add .
	git commit -am 'update'

vagrant:
	-vagrant destroy -f
	-vagrant up --provision
	vagrant destroy -f

