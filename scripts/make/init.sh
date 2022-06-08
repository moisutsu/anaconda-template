#!/bin/bash -eu

# Create conda virtual environment
if [ -e "$HOME/miniforge3/bin/activate" ]; then
    source "$HOME/miniforge3/bin/activate"
fi

eval "$(conda shell.zsh hook)"

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
bash scripts/make/export.sh

# Use pip in conda
conda config --set pip_interop_enabled True
