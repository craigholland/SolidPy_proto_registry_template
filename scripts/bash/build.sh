#!/bin/bash

set -e

# Run tests
#poetry run pytest -v -s

# Run linters
#poetry run black solidpy_proto -l 79
#poetry run flake8 solidpy_proto --ignore=E203,W503,W504

# Update the version in pyproject.toml based on CHANGELOG.md
python scripts/py/update_version.py

# Build the project
poetry build
