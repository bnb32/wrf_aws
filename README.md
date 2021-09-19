# README #

This repo is for setting up wrf on AWS.

**RUNNING WRF**

1. Create new cloud9 instance:  
   - select Ubuntu under "Platform"  
   - select vpc-00177ee82dc8fe654 under "Network Settings"

2. Add default security group to your cloud9 instance    
   - Go to AWS console  
   - Click on running instances  
   - Click on your instance in the list  
   - Click on actions, networking, change security groups  
   - Select default group and assign group

3. Clone wrf_aws repo to your cloud9 instance

4. Run the following commands to install packages and mount storage

    `$ cd wrf_aws`   
    `$ ./go`  

5. To run wrf first edit namelist files for your own application
    
    `$ cd forecast/templates`  
    `$ vim namelist.wps`  
    `$ vim namelist.input`  

6. Then edit the runwrf script to select length of simulation
    
    `$ cd forecast`  
    `$ vim runwrf`  

7. Edit `N_DAYS` and `USERNAME` variables in `runwrf`

7. Finally run wrf
    
    `$ ./runwrf`  

8. wrf output will be in `'/data/<username>/wrfout'`

**POST-PROCESSING**

1. For post-processing login to your workspace

2. Open a terminal and clone wrf_aws

3. again run the following commands  
    
    `$ cd wrf_aws`  
    `$ ./go`  

4. This will setup a python conda environment  
   - to run conda open another terminal  
   - run the following command  

    `$ conda activate ecrl`  

