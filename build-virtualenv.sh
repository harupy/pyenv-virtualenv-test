#!/usr/bin/env bash
set -ex

eval "$(pyenv init -)"

python_version=$(cat python-version)
env_name=test
pyenv install --skip-existing $python_version
virtualenv --python $(pyenv prefix $python_version)/bin/python $env_name
source $env_name/bin/activate

pip install -r requirements.txt
