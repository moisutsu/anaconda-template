#!/bin/bash

DEFAULT_ENV_NAME="anaconda_template"
DEFAULT_PTHON_VERSION="3.9"
ENVRC_PLACEHOLDER="<ENVRC_PLACEHOLDER>"

echo -n "Env name [${DEFAULT_ENV_NAME}]: "
read -r env_name

echo -n "Python version [${DEFAULT_PTHON_VERSION}]: "
read -r python_version

env_name="${env_name:-$DEFAULT_ENV_NAME}"
python_version="${python_version:-$DEFAULT_PTHON_VERSION}"

if [ -e "$HOME/miniforge3/bin/activate" ]; then
    source "$HOME/miniforge3/bin/activate"
fi

eval "$(conda shell.zsh hook)"

conda create -n "${env_name:-$DEFAULT_ENV_NAME}" python="${python_version:-$DEFAULT_PTHON_VERSION}"

envrc_content="#!/bin/bash

if [ -e \"\$HOME/miniforge3/bin/activate\" ]; then
    source \"\$HOME/miniforge3/bin/activate\"
fi

eval \"\$(conda shell.zsh hook)\"
conda activate $ENVRC_PLACEHOLDER"

envrc_content="${envrc_content//$ENVRC_PLACEHOLDER/$env_name}"

echo "$envrc_content" > .envrc

direnv allow
