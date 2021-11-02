all: help

.PHONY: help
help:
	@echo "Available targets:"
	@echo "- build: python package building"
	@echo "- clean: clean temp files, venv, etc"

.PHONY: build
build: .venv/ok
	@./scripts/build.sh

.venv/ok:
	@./scripts/setup_venv.sh

.PHONY: clean
clean:
	rm -rf .venv osc_sdk.egg-info dist