UV := /root/.local/bin/uv

ANSIBLEPB := LANG=C ansible-playbook -i localhost, -c local

default:
	@cat makefile | grep ^[a-z] | sort | sed 's/^/make /g;s/:.*//g'

all: setup install local

# uvのインストール確認と自動インストール
setup:
	@command -v $(UV) >/dev/null 2>&1 || { \
		curl -LsSf https://astral.sh/uv/install.sh | sh; \
		exit 1; \
	}
	@echo "uv is installed: $$($(UV) --version)"

install: setup
	$(UV) sync

lint: dev
	$(UV) run ansible-lint

lintfix: dev
	$(UV) run ansible-lint --fix

dev: setup
	$(UV) add --dev ansible-lint

local: install
	$(UV) run $(ANSIBLEPB) r.yml

test: install
	$(UV) run $(ANSIBLEPB) serverspec.yml

pxe: install
	$(UV) run $(ANSIBLEPB) pxe.yml

justup:
	vagrant up --no-provision

.PHONY: all local test pxe install dev setup

clean:
	rm -rf .venv
	rm -f uv.lock
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

# 便利な追加コマンド
add: setup
	$(UV) add $(PACKAGE)

add-dev: setup
	$(UV) add --dev $(PACKAGE)

lock: setup
	$(UV) lock

upgrade: setup
	$(UV) lock --upgrade

# uvの手動インストール用
install-uv:
	curl -LsSf https://astral.sh/uv/install.sh | sh

