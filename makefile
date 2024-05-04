default:
	cat makefile | grep ^[a-z]

update:
	git status
	sleep 5
	git add .
	git commit -am 'update'

local:
	/usr/local/bin/ansible-playbook -i hosts r.yml -c local

.PHONY: serverspec
serverspec:
	/usr/local/bin/ansible-playbook -i hosts serverspec.yml -c local
