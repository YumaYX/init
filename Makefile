UV := ~/.local/bin/uv
ENV_VARS := sudo -E LANG=C
ANSIBLE_CMD := ansible-playbook -i localhost, -c local

.PHONY: default all install local test pxe vagrant clean

default:
	@cat makefile | grep ^[a-z] | sort | sed 's/^/make /g;s/:.*//g'


all: install local

install:
	@command -v $(UV) >/dev/null 2>&1 || curl -LsSf https://astral.sh/uv/install.sh | sh
	@echo "uv is installed: $$($(UV) --version)"
	$(UV) sync

# Main Functions

local: install
	$(ENV_VARS) $(UV) run $(ANSIBLE_CMD) ans_init.yml

test: install
	$(ENV_VARS) $(UV) run $(ANSIBLE_CMD) ans_serverspec.yml

pxe: install
	$(ENV_VARS) $(UV) run $(ANSIBLE_CMD) ans_pxe.yml

# Development

vagrant: clean
	-vagrant destroy -f
	-vagrant up --provision
	vagrant destroy -f --no-tty

clean:
	sudo date
	-vagrant destroy -f
	sudo rm -rf .venv uv.lock .vagrant
