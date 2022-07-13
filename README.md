# anaconda-template

Templates for convenient Anaconda use

# Clone into current directory

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/moisutsu/anaconda-template/main/clone_into_current_dir.sh)"
```

## How to use

Require
- [direnv](https://github.com/direnv/direnv)

### Initialize the virtual environment

Create a virtual environment for conda, set up direnv, etc.

```bash
make init
```

The default virtual environment name is the *current directory name* and the default Python version is `3.9`.

You can customize the virtual environment name and Python version as follows.

```bash
make init ENV_NAME=custom_name PYTHON_VERSION=3.10
```

### Export environmental information

Write environment information in `environment.yml`.

```bash
make export
```

### Import environmental information

Install the libraries written in `environment.yml`.

```bash
make import
```

### Remove virtual environment

Remove the conda virtual environment.

```bash
make remove
```
