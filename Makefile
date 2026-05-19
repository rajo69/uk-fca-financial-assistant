.PHONY: help install install-dev install-all sync lint format test smoke clean precommit ci

help:
	@echo "Available targets:"
	@echo "  install      - install core deps only"
	@echo "  install-dev  - install core + dev deps"
	@echo "  install-all  - install everything except training (training is Kaggle-only)"
	@echo "  sync         - uv sync (apply pyproject changes)"
	@echo "  lint         - ruff check + mypy"
	@echo "  format       - ruff format"
	@echo "  test         - pytest with coverage"
	@echo "  smoke        - fast sanity tests only"
	@echo "  precommit    - run pre-commit on all files"
	@echo "  clean        - remove caches"

install:
	uv sync

install-dev:
	uv sync --extra dev

install-all:
	uv sync --extra dev --extra data --extra eval --extra rag --extra serving

sync:
	uv sync

lint:
	uv run ruff check src tests
	uv run mypy src

format:
	uv run ruff format src tests
	uv run ruff check --fix src tests

test:
	uv run pytest

smoke:
	uv run pytest tests/unit -x --no-cov

precommit:
	uv run pre-commit run --all-files

ci: lint test

clean:
	rm -rf .pytest_cache .ruff_cache .mypy_cache .coverage htmlcov dist build *.egg-info
