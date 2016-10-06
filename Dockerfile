FROM andrewosh/binder-base

USER root

RUN \
  apt-get update -y && apt-get install -y --force-yes \
  git-core \
  wget \
  make \
  cmake \
  libboost-dev \
  libgmp-dev \
  swig \
  libcppunit-dev \
  gcc \
  gfortran \
  g++ \
  libblas-dev \
  liblapack-dev \
  libatlas-base-dev \
  libatlas-dev \
  lp-solve \
  liblpsolve55-dev \
  python \
  python-dev \
  python-lxml \
  python-pytest \
  python-scipy \
  python-matplotlib \
  wget \
  bash \
  libbullet-dev \
  python-h5py \
  libgl1-mesa-glx \
  libglu1-mesa \
  libgl1-mesa-dev \
  libglu1-mesa-dev \
  libglapi-mesa \
  libfreetype6-dev \
  doxygen \
  python-sphinx
RUN mkdir -p /usr/local
RUN conda remove libgfortran && \
    conda install libgcc --force
RUN \
  git clone https://github.com/siconos/siconos.git && \
  mkdir build && \
  cd build && \
  mkdir siconos && \
  cd siconos && \
  cmake ../../siconos -DWITH_DOXY2SWIG=ON -DDEV_MODE=ON -DCMAKE_BUILD_TYPE=Debug -DWITH_MECHANISMS=OFF -DWITH_DOCUMENTATION=ON && \
  make -j 4 && \
  make install
