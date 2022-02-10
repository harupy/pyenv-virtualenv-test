FROM ubuntu:20.04

RUN apt update -y
RUN apt install -y sudo
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC sudo apt-get install -y tzdata
RUN sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl git llvm libncurses5-dev \
    libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl
RUN git clone https://github.com/pyenv/pyenv.git -b v2.2.4 --depth 1 /root/.pyenv
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
ENV PYENV_ROOT="/root/.pyenv"
ENV PATH="$PYENV_ROOT/bin:$PATH"
RUN eval "$(pyenv init --path)" \
    && pyenv install 3.8.10 \
    && pyenv global 3.8.10
RUN eval "$(pyenv init --path)" && pip install virtualenv

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p /root/miniconda3
RUN rm -f Miniconda3-latest-Linux-x86_64.sh
ENV PATH="/root/miniconda3/bin:${PATH}"
