FROM ubuntu:20.04

RUN apt update -y
RUN apt install -y sudo
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC sudo apt-get install -y tzdata
RUN sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl git llvm libncurses5-dev \
    libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl
RUN curl https://pyenv.run | bash
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
RUN echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

ENV PYENV_ROOT="/root/.pyenv"
ENV PATH="$PYENV_ROOT/bin:$PATH"
RUN eval "$(pyenv init --path)"
RUN pyenv install 3.7.12
RUN pyenv global 3.7.12
RUN pip install virtualenv
