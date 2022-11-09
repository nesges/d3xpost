#!/bin/bash

echo 'Install required packages'
apt-get update
apt-get install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev python-dev python3-dev

echo 'Install pyenv'
curl https://pyenv.run | bash
echo '# pyenv' >> ~/.bashrc
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
exec $SHELL
pyenv --version

echo 'Install python 3.7.15'
pyenv install 3.7.15
pyenv local 3.7.15

echo 'Install pipenv'
pipenv pip3 install pipenv
PIPENV_VENV_IN_PROJECT=1 pipenv install

echo 'Copy Configfile'
cp config.py.sample config.py

echo 'Create SQLite database in moa.db'
MOA_CONFIG=DevelopmentConfig pipenv run python -m moa.models