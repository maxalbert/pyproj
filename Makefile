# Note: we assume that pipenv is present so that we can install pyproj
#       and build the wheel within an isolated pipenv environment.
#       Howver, you can set PIPENV_RUN_CMD="" to run the commands
#       directly with whatever pip and python you have installed on
#       your system (do this at your own risk!).
#
PIPENV_RUN_CMD ?= pipenv run

all:

install:
	$(PIPENV_RUN_CMD) pip install -r requirements-dev.txt
	$(PIPENV_RUN_CMD) pip install -e .

test:
	$(PIPENV_RUN_CMD) pip nose2 -v

build-wheel: install test
	$(PIPENV_RUN_CMD) python setup.py bdist_wheel
