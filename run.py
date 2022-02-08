import subprocess
import uuid


def run(cmd):
    print("Running:", cmd)
    return subprocess.run(cmd)


def read_file(path):
    with open(path) as f:
        return f.read()


PYTHON_VERSION_FILE = "python-version"
REQUIREMENTS_TEXT_FILE = "requirements.txt"

python_version = read_file(PYTHON_VERSION_FILE).strip()
script = """
set -ex

# Initialize `pyenv`
eval "$(pyenv init -)"

# Build environment
pyenv install --skip-existing {python_version}
virtualenv --python $(pyenv prefix {python_version})/bin/python .venv-{env_name}
source .venv-{env_name}/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run the entrypoint script
python entrypoint.py
""".format(
    python_version=python_version, env_name=uuid.uuid4().hex,
)

run(["bash", "-c", script])
