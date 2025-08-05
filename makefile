UV := /root/.local/bin/uv

ENV_VARS := LANG=C
ANSIBLE_CMD := ansible-playbook -i localhost, -c local

default:
	@cat makefile | grep ^[a-z] | sort | sed 's/^/make /g;s/:.*//g'

all: setup install local

setup:
	@command -v $(UV) >/dev/null 2>&1 || { \
		echo "Installing uv..."; \
		curl -LsSf https://astral.sh/uv/install.sh | sh; \
		echo "Please restart your terminal or run: source ~/.bashrc"; \
		echo "Then run 'make install' again."; \
		exit 1; \
	}
	@echo "uv is installed: $$($(UV) --version)"

install: setup
	$(UV) sync

#lint: dev
#	$(UV) run ansible-lint

#lintfix: dev
#	$(UV) run ansible-lint --fix

dev: setup
	$(UV) add --dev ansible-lint

local: install
	$(ENV_VARS) $(UV) run $(ANSIBLE_CMD) r.yml

test: install
	$(ENV_VARS) $(UV) run $(ANSIBLE_CMD) serverspec.yml

pxe: install
	$(ENV_VARS) $(UV) run $(ANSIBLE_CMD) pxe.yml

justup:
	vagrant up --no-provision

.PHONY: all local test pxe install dev setup

clean:
	-vagrant destroy -f
	rm -rf .venv uv.lock .vagrant

update:
	git status
	sleep 5
	git add .
	git commit -am 'update'

vagrant:
	-vagrant destroy -f
	-vagrant up --provision
	vagrant destroy -f

add: setup
	$(UV) add $(PACKAGE)

add-dev: setup
	$(UV) add --dev $(PACKAGE)

lock: setup
	$(UV) lock

upgrade: setup
	$(UV) lock --upgrade

install-uv:
	curl -LsSf https://astral.sh/uv/install.sh | sh
	@echo "Please restart your terminal or run: source ~/.bashrc"
