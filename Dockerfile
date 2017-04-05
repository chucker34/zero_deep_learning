FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  bzip2 \
  git \
  wget \
  python-qt4

# install pyenv
RUN git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
RUN git clone https://github.com/yyuu/pyenv-pip-rehash.git /root/.pyenv/plugins/pyenv-pip-rehash
ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH
RUN echo 'eval "$(pyenv init -)"' >> .bashrc

# install anaconda
ENV MINICONDA_VER 4.1.11
RUN pyenv install miniconda3-$MINICONDA_VER
RUN pyenv global miniconda3-$MINICONDA_VER
ENV PATH $PYENV_ROOT/versions/miniconda3-$MINICONDA_VER/bin:$PATH

# install modules
RUN conda update -y conda
RUN pip install --upgrade pip
RUN conda install -y NumPy matplotlib
