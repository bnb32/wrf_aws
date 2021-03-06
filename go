#!/bin/bash

PLATFORM=`cat /etc/*-release`

if grep -q 'NAME="Amazon Linux"' <<< $PLATFORM; then

    echo "Running on Amazon Workspace"

    echo "Installing linux packages"
    
    bash scripts/workspace-apps.sh
    
    echo "Mounting external storage"
    
    bash scripts/storage.sh
    
    echo "Configuring python environment"
    
    bash scripts/conda.sh
    
    echo "Done"

elif grep -q 'NAME="Ubuntu"' <<< $PLATFORM; then

    echo "Running on Ubuntu"
	
    echo "Installing linux packages"
    bash scripts/c9-apps.sh

    echo "Mounting external storage"
    bash scripts/storage.sh

    echo "Done"

fi
	
