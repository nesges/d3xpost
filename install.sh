#!/bin/bash

echo ''
echo '!! PROCEED AT OWN RISK !!'
echo ''
echo 'This is more a less just a notepad of what I did on my personal installation'
echo '(Ubuntu 22) to make moa work. I have literally no idea if this could BREAK'
echo 'any other system. You may want to review the skript prior to running it and'
echo 'by all means: Use it at your own RISK! I cannot support you, if anything goes'
eche 'sideways.'
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
    echo $@
    echo ''
    ask
    $@
}


ask

echo ''
echo '[ APT ]'
echo ''
echo 'Installing required packages'
execute sudo apt update
execute sudo apt install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev python3-dev

echo ''
echo '[ PYENV ]'
echo ''
echo 'Installing pyenv'
echo ''
echo I am going to execute:
echo 'curl https://pyenv.run | bash'
echo ''
ask
curl https://pyenv.run | bash
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
execute ~/.pyenv/bin/pyenv install 3.7.15
execute ~/.pyenv/bin/pyenv local 3.7.15

echo ''
echo '[ PIPENV ]'
echo ''
echo 'Install pipenv'
execute pip3 install pipenv
execute PIPENV_VENV_IN_PROJECT=1 pipenv install

echo ''
echo '[ CONFIG ]'
echo ''
echo 'Copy Configfile'
execute cp config.py.sample config.py

echo ''
echo '[ DATABASE ]'
echo ''
echo 'Create SQLite database in moa.db'
execute MOA_CONFIG=DevelopmentConfig pipenv run python -m moa.models

echo ''
echo 'I am done here. Next you should edit config.py and then you may run the'
echo 'server with ./run-dev.sh and the workers with ./run-worker.sh. You may'
echo 'want to run d3xpost as a systemd service. Use d3xpost-service as a template'
echo 'for that. Good luck! :-)'