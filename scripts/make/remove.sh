#!/bin/bash -eu

ENV_NAME="$CONDA_DEFAULT_ENV"

while true; do
    read -p "Remove virtual environment \"$ENV_NAME\" ([y]/n)? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit 0;;
        * ) ;;
    esac
done

eval "$(conda shell.zsh hook)"

conda deactivate

conda env remove -n "$ENV_NAME"
