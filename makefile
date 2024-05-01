default:
	cat makefile | grep ^[a-z]

test:
	chmod 400 config/id_rsa
	ansible -i hosts all -m ping

role: test
	ansible-playbook -i hosts r.yml -v

freeze:
	python3 -m pip freeze > requirements.txt

install:
	python3 -m venv venv
	echo source venv/bin/activate
	#python3 -m pip install -r requirements.txt

update:
	git status
	sleep 3
	git add .
	git commit -am 'update'
