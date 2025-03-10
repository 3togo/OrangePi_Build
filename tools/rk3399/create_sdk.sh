#!/bin/bash
set -e

#
# This script is used to build different OrangePi system.
# 
TOP_ROOT=`pwd`/scripts

# Get root first
cd $TOP_ROOT/lib
clear
./GetRoot.sh

# Prepare running-tools
if [ ! -f $TOP_ROOT/lib/.tmp_tools ]; then
    sudo ./PrepareTool.sh
    echo "Install Toolchain" > $TOP_ROOT/lib/.tmp_tools
fi

sudo ./RK3399SDK_BuildEnvironment.sh
