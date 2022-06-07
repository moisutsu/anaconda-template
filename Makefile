SHELL=/bin/bash

export
ENV_NAME ?= $(shell basename $(CURDIR))
PTHON_VERSION ?= 3.9
ENVRC_PLACEHOLDER = <ENVRC_PLACEHOLDER>
CONDA_ENV_FILE = environment.yml


.PHONY: init
init:
	bash scripts/make/init.sh

.PHONY: env
env:
	bash scripts/make/env.sh

.PHONY: remove
remove:
	bash scripts/make/remove.sh

.PHONY: update
update:
	bash scripts/make/update.sh
