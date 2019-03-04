#!/bin/bash

set -x -euf -o pipefail
# fix PS1: unbound variable error due to set -u
PS1="\w\$ "

# Some google keys are stored in circleci environment variables
# Call this BEFORE set -x to avoid printing out our service key
echo $GCR_TM_AUTH > ${HOME}/gcloud-service-key.json

$HOME/devenv/virtualenv venv
. venv/bin/activate

pip install -r requirements.txt
LONG_COMMIT=$(git -C . rev-parse HEAD)

bluecore cloudbuild . --config cloudbuilder.yaml --service-name <service_name> --tag LONG_COMMIT --gcloud-key-path $HOME/gcloud-service-key.json
