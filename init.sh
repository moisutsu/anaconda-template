#!/bin/bash

# Define constants
DEFAULT_ENV_NAME="anaconda_template"
DEFAULT_PTHON_VERSION="3.9"

ENVRC_PLACEHOLDER="<ENVRC_PLACEHOLDER>"
CONDA_ENV_FILE="conda_env.yml"

# Input custom values
echo -n "Env name [${DEFAULT_ENV_NAME}]: "
read -r env_name

echo -n "Python version [${DEFAULT_PTHON_VERSION}]: "
read -r python_version

env_name="${env_name:-$DEFAULT_ENV_NAME}"
python_version="${python_version:-$DEFAULT_PTHON_VERSION}"

# Create conda virtual environment
if [ -e "$HOME/miniforge3/bin/activate" ]; then
    source "$HOME/miniforge3/bin/activate"
fi

eval "$(conda shell.zsh hook)"

conda create -n "$env_name" python="$python_version"

# Create .envrc
envrc_content="#!/bin/bash

if [ -e \"\$HOME/miniforge3/bin/activate\" ]; then
    source \"\$HOME/miniforge3/bin/activate\"
fi

eval \"\$(conda shell.zsh hook)\"
conda activate $ENVRC_PLACEHOLDER"

envrc_content="${envrc_content//$ENVRC_PLACEHOLDER/$env_name}"

echo "$envrc_content" > .envrc

# Configure direnv
direnv allow

# Add pre-commit hook for automatic package saving
conda env export > "$CONDA_ENV_FILE"

echo "#!/bin/sh

conda env export > \"$CONDA_ENV_FILE\"

for FILE in \`git diff --staged --name-only\`; do
    git add \$FILE
done" > pre-commit

chmod 755 pre-commit
mv pre-commit .git/hooks/pre-commit
