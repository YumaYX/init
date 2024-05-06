default:
	cat makefile | grep ^[a-z]

install:
	python3.11 -m venv venv
	#source venv/bin/activate
	#pip3.11 install -r requirements.txt

update:
	git status
	sleep 5
	git add .
	git commit -am 'update'

local:
	ansible-playbook -i hosts r.yml -c local

.PHONY: serverspec
serverspec:
	ansible-playbook -i hosts serverspec.yml -c local

pxe:
	ansible-playbook -i hosts pxe.yml -c local

