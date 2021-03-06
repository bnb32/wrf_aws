#!/bin/bash

export JASPER_VERSION="2.0.16"
export WRF_VERSION="4.2"
export WPS_VERSION="4.2"
export BUILDDIR='/data/'

export CC='gcc'
export CXX='g++'
export FC='gfortran'
export F77='gfortran'
export FCFLAGS='-m64'
export JASPERDIR=$BUILDDIR'/jasper'
export JASPERLIB=$JASPERDIR'/lib'
export JASPERINC=$JASPERDIR'/include'
export LD_LIBRARY_PATH=$JASPERLIB
export NETCDF='/usr'
export WRFIO_NCD_LARGE_FILE_SUPPORT=1
export WRF_DIR=$BUILDDIR'/WRF-'${WRF_VERSION}
export WPS_DIR=$BUILDDIR'/WPS-'${WPS_VERSION}
export WPS_GEOG_DIR=$BUILDDIR'/WPS_GEOG'

export TASK_ROOT='/opt'
export PYTHONPATH='/opt'
export WORKDIR='/opt'
