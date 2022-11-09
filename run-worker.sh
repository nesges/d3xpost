#!/bin/bash
export MOA_CONFIG=DevelopmentConfig 
cd /opt/moa
for i in {1..1}
do 
    echo running worker $i
    ~/.pyenv/shims/pipenv run python -m moa.worker --worker $i
done