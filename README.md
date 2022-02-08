```
docker build -t pyenv-virtualenv .
docker run -it --rm pyenv-virtualenv bash
docker run -it --rm --workdir /app pyenv-virtualenv bash
docker run --rm --workdir /app  -v $(pwd):/app pyenv-virtualenv bash -ic "python test.py"

pyenv install 3.7.10
pyenv virtualenv 3.7.10 my-test-env
```
