#Install python packages
sudo ln -sf /usr/lib64/*netcdf* /usr/lib/ && \
conda create -n ecrl
conda activate ecrl
conda install boto3 \
numpy \
cartopy \
matplotlib \
netcdf4 \
pyyaml \
scipy \
xarray \
conda install -c conda-forge wrf-python
