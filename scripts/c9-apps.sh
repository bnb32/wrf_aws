#Install linux packages
sudo apt-get update -y && \
sudo apt-get install -y --no-install-recommends \
nfs-common \
autoconf \
tcsh \
build-essential \
cmake \
csh \
file \
gfortran \
libgeos-dev \
libmpich-dev \
libnetcdf-dev \
libnetcdff-dev \
libpng-dev \
libproj-dev \
mpich \
proj-bin \
time \
netcdf-bin \
wget

sudo ln -sf /data/jasper/lib/*jasper* /usr/lib
