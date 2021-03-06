#!/bin/bash

source `dirname $0`/../environment.sh

#Download source
sudo mkdir -p $BUILDDIR
sudo chown -R ubuntu:ubuntu $BUILDDIR

if [ ! -d $JASPERDIR ]
then
    echo "Downloading Jasper"
    sudo wget -O $BUILDDIR/jasper.tgz -q https://codeload.github.com/mdadams/jasper/tar.gz/version-$JASPER_VERSION
    sudo tar -xf $BUILDDIR/jasper.tgz --directory $BUILDDIR
fi
    
if [ ! -d $WRF_DIR ]
then	
    echo "Downloading WRF"
    sudo wget -O $BUILDDIR/wrf.tgz -q https://codeload.github.com/wrf-model/WRF/tar.gz/v$WRF_VERSION
    sudo tar -xf $BUILDDIR/wrf.tgz --directory $BUILDDIR
fi
    
if [ ! -d $WPS_DIR ]
then    	
    echo "Downloading WPS"
    sudo wget -O $BUILDDIR/wps.tgz -q https://codeload.github.com/wrf-model/WPS/tar.gz/v$WPS_VERSION
    sudo tar -xf $BUILDDIR/wps.tgz --directory $BUILDDIR
fi

if [ ! -d $WPS_GEOG_DIR ]
then    	
    echo "Downloading WPS_GEOG"
    sudo wget -O $BUILDDIR/wps_geog.tgz -q https://www2.mmm.ucar.edu/wrf/src/wps_files/geog_high_res_mandatory.tar.gz    
    sudo tar -xf $BUILDDIR/wps_geog.tgz --directory $BUILDDIR
fi

sudo rm -f $BUILDDIR/*.tgz && \

#Compile wrf

if [ ! -d $JASPERDIR ]
then	
    echo "Compiling Jasper"
    
    sudo mkdir -p $BUILDDIR/jasper-build && \
    sudo cmake \
      -G "Unix Makefiles" \
      -H$BUILDDIR/jasper-version-$JASPER_VERSION \
      -B$BUILDDIR/jasper-build \
      -DCMAKE_INSTALL_PREFIX=$JASPERDIR && \
    cd $BUILDDIR/jasper-build && \
    sudo make install && \
    cd $BUILDDIR && \
    sudo rm -rf jasper-* && \
    
    echo "Done Compiling Jasper"
fi

echo "Compiling WRF"

sudo chown -R ubuntu:ubuntu $BUILDDIR/WRF-$WRF_VERSION
cd $BUILDDIR/WRF-$WRF_VERSION && \
printf '34\n1\n' | $BUILDDIR/WRF-$WRF_VERSION/configure && \
$BUILDDIR/WRF-$WRF_VERSION/compile em_real 2>&1 | tee compile.log && \

echo "Done Compiling WRF"

echo "Compiling WPS"

sudo chown -R ubuntu:ubuntu $BUILDDIR/WPS-$WPS_VERSION
cd $BUILDDIR/WPS-$WPS_VERSION && \
printf '1\n' | $BUILDDIR/WPS-$WPS_VERSION/configure && \
$BUILDDIR/WPS-$WPS_VERSION/compile 2>&1 | tee compile.log && \

echo "Done Compiling WPS"

#Clean up
#
#sudo apt-get remove -y --auto-remove \
#  build-essential \
#  cmake \
#  wget && \
#sudo rm -rf /var/lib/apt/lists/* && \

