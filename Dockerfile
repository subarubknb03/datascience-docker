FROM ubuntu:latest
# update and install
RUN apt-get update && apt-get install -y \
    sudo \
    wget \
    vim \
    libx11-6 \
    libx11-dev \
    graphviz

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
    japanize_matplotlib \
    pydotplus \
    xgboost \
    lightgbm \
    optuna

WORKDIR /
RUN mkdir /work
WORKDIR /work

# execute jupyterlab as default command
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]