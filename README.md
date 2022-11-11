
```
 _______   ____    / /              /| 
 \_   _ \ /__  \ \/ /___  ___  ____| |___         _ __ ___   ___   __ _  
   | | \ \  _| /\  // _ \/ _ \/ ___   __/        | '_ ` _ \ / _ \ / _` | 
  _| |_/ /___| \/  \|(_) |(_) |__ \| |   powered | | | | | | (_) | (_| | 
 /______/ \____/ /\ |  _/\___/___\ \_|      by   |_| |_| |_|\___/ \__,_| 
              / /   |_|      /_____/                                     
```

this is a fork of https://gitlab.com/fedstoa/moa with the added ability to add a suffix to tweets and toots. You can use it as a public service on https://xpost.dnddeutsch.de. For installation instructions see the original repo.

Here's what I did to install moa on a Ubuntu 22 machine. I have absolutely no idea if following this steps could harm or break your system. So **proceed at your own risk!**

```
# install some needed packages
apt update
apt install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev python3-dev
# install pyenv
curl https://pyenv.run | bash
# add pyenv to PATH in ~/.bashrc
echo '# pyenv' >> ~/.bashrc
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
# install python 3.7.15
~/.pyenv/bin/pyenv install 3.7.15
~/.pyenv/bin/pyenv local 3.7.15
# install pipenv
pip3 install pipenv
PIPENV_VENV_IN_PROJECT=1 pipenv install
# copy config
cp config.py.sample config.py
# create SQLite database in moa.db
MOA_CONFIG=DevelopmentConfig pipenv run python -m moa.models
# edit config.py
```
