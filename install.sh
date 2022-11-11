#!/bin/bash

echo ''
echo '!! PROCEED AT OWN RISK !!'
echo ''
echo 'This is more a less just a notepad of what I did on my personal installation'
echo '(Ubuntu 22) to make moa work. I have no idea if this BREAKS any other system.'
echo 'Use this skript at your own RISK.'
echo ''
echo '!! PROCEED AT OWN RISK !!'
echo ''

ask() {
    read -p "Continue? (yes/no) " -r
    if [[ $REPLY != 'yes' ]]
    then
        exit
    fi
}

execute() {
    echo ''
    echo I am going to execute:
    echo $1
    echo ''
    ask
    $1
}


ask

echo ''
echo '[ APT ]'
echo ''
echo 'Installing required packages'
execute "apt update"
execute "apt-get install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev python3-dev"

echo ''
echo '[ PYENV ]'
echo ''
echo 'Installing pyenv'
echo '# pyenv' >> ~/.bashrc
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
echo ''
~/.pyenv/bin/pyenv --version

echo ''
echo '[ PYTHON ]'
echo ''
echo 'Install python 3.7.15'
execute "~/.pyenv/bin/pyenv install 3.7.15"
execute "~/.pyenv/bin/pyenv local 3.7.15"

echo ''
echo '[ PIPENV ]'
echo ''
echo 'Install pipenv'
execute "~/.pyenv/shims/pipenv pip3 install pipenv"
execute "PIPENV_VENV_IN_PROJECT=1 ~/.pyenv/shims/pipenv install"

echo ''
echo '[ CONFIG ]'
echo ''
echo 'Copy Configfile'
execute "cp config.py.sample config.py"

echo ''
echo '[ DATABASE ]'
echo ''
echo 'Create SQLite database in moa.db'
execute "MOA_CONFIG=DevelopmentConfig pipenv run python -m moa.models"