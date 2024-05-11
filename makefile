default:
	cat makefile | grep ^[a-z]

all: install local serverspec

install:
	python3 -m venv venv
	source venv/bin/activate && pip3 install --upgrade pip
	source venv/bin/activate && pip3 install --no-cache-dir ansible

update:
	git status
	sleep 5
	git add .
	git commit -am 'update'

local: install
	source venv/bin/activate && ansible-playbook -i hosts r.yml -c local

serverspec: install
	source venv/bin/activate && ansible-playbook -i hosts serverspec.yml -c local

pxe: install
	source venv/bin/activate && ansible-playbook -i hosts pxe.yml -c local

.PHONY: all local serverspec pxe
