all: help

.PHONY: help
help:
	@echo "Available targets:"
	@echo "- build: python package building"
	@echo "- pypi-upload: upload python package to pip"
	@echo "- clean: clean temp files, venv, etc"

.PHONY: build
build: .venv/ok
	@./scripts/build.sh

.venv/ok:
	@./scripts/setup_venv.sh

.PHONY: clean
clean:
	rm -rf .venv osc_sdk.egg-info dist

.PHONY: pypi-upload
pypi-upload: .venv/ok
	. .venv/bin/activate && twine upload dist/*