#!/bin/bash

sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum-config-manager --enable epel

sudo yum update -y && \
sudo yum install -y \
openmpi-devel \
geos-devel \
autoconf \
tcsh \
csh \
file \
gcc \
gcc-gfortran \
netcdf-devel \
proj \
proj-devel \
proj-bin \
time \
wget \
python3 \
