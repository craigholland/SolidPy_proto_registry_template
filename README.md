# solidpy proto registry template
base structure for SolidPy proto registries

# Contains:
- `scripts/` directory for parent bash/python scripts
- `.env` file for submodule-specific environment variables
- `.gitignore` file for gitignore rules
- `pyproject.toml` file for submodule-specific project settings. __NOTE__: This is a template file with __\*placeholders\*__ that need to be substituted with actual values
- pre-populated dependencies in the toml's `dependencies` section
- various git/flake files and preset settings in the toml's `tool` section

# Proto Registry Usage
- Add proto files to `proto/` directory
- Run `poetry protoc` to compile proto files
- Generated Python files will be placed in `solidpy_proto/protopy` directory
- Generated GRPC files will be placed in `solidpy_proto/protogrpc` directory

# Basic Setup and Usage
- Configure Poetry Auth to use GCP Artifact Registry:
- `$ poetry config http-basic.pypi-gcp oauth2accesstoken $(gcloud auth print-access-token)`
- Edit `pyproject.toml` and replace all __\*placeholders\*__ with actual values
- Add additional dependencies to `pyproject.toml` as needed:
  - `$ poetry add <dependency>`
- Create a virtual environment and install dependencies:
  - `$ poetry update`
- Run tests:
  - `$ poetry run pytest`
- Run linters:
  - `poetry run black <project>_<submodule> -l 79`
  - `poetry run flake8 <project>_<submodule> --ignore=E203,W503,W504`
- Update CHANGELOG.md with changes
- Sync version in `pyproject.toml` with `CHANGELOG.md`
  - `$ poetry run python scripts/py/update_version.py` 
- Publish to GCP Artifact Registry:
  - `$ poetry publish --build --repository pypi-gcp`
