PIP := .env/bin/pip
TOX := .env/bin/tox
PYTHON := .env/bin/python


# create virtual environment
.env:
	virtualenv .env -p python3

# install deployment dependencies
install: .env
	$(PIP) install -e .

# install dev dependencies, create layers directory
develop: .env
	.env/bin/pip install -r requirements-dev.txt

# run unit tests
test: .env
	$(PIP) install tox
	$(TOX) -e unit

# run integration tests: will create a test deployment
testi: .env
	$(PIP) install tox
	$(TOX) -e integration

# remove .env
clean:
	rm -rf .env

# upload to Pypi
pypi: develop
	$(PYTHON) setup.py sdist upload
