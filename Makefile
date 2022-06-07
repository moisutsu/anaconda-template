SHELL=/bin/bash

export
ENV_NAME ?= $(shell basename $(CURDIR))
PTHON_VERSION ?= 3.9
ENVRC_PLACEHOLDER = <ENVRC_PLACEHOLDER>
CONDA_ENV_FILE = environment.yml


.PHONY: init
init:
	bash scripts/make/init.sh

.PHONY: export
export:
	bash scripts/make/export.sh

.PHONY: import
import:
	bash scripts/make/import.sh

.PHONY: remove
remove:
	bash scripts/make/remove.sh
