#!/bin/bash -eu

# Load conda
if [ -e "$HOME/miniforge3/bin/activate" ]; then
    source "$HOME/miniforge3/bin/activate"
fi
eval "$(conda shell.zsh hook)"

# Create conda virtual environment
conda create -n "$ENV_NAME" python="$PTHON_VERSION"

# Create .envrc for direnv
echo "#!/bin/bash

if [ -e \"\$HOME/miniforge3/bin/activate\" ]; then
    source \"\$HOME/miniforge3/bin/activate\"
fi

eval \"\$(conda shell.zsh hook)\"
conda activate $ENV_NAME" > .envrc

direnv allow

# Create conda env file
source .envrc

# Use pip in conda
conda config --set pip_interop_enabled True
