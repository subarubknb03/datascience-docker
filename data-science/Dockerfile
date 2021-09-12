FROM ubuntu:20.04
# update and install
RUN apt-get update && apt-get install -y \
    graphviz \
    libx11-6 \
    libx11-dev \
    sudo \
    vim \
    wget

# install anaconda3
WORKDIR /opt
# download anaconda3 package and install anaconda3
RUN wget https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh && \
    sh Anaconda3-2020.11-Linux-x86_64.sh -b -p /opt/anaconda3 && \
    rm -f Anaconda3-2020.11-Linux-x86_64.sh

# set path
ENV PATH=/opt/anaconda3/bin:$PATH

# update pip
RUN pip install --upgrade pip && pip install \
    graphviz \
    imblearn \
    japanize_matplotlib \
    lightgbm \
    mojimoji \
    pandas_profiling \
    pydotplus \
    optuna \
    tqdm \
    xgboost

WORKDIR /
RUN mkdir /work
WORKDIR /work

# execute jupyterlab as default command
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]