#!/usr/bin/bash

echo "##################################################"
echo "###########  PATCH GENODE SOURCE  #############"
echo "##################################################"
echo ""

if [ ! -f /bin/git ]; then
    echo "git not found!"
	exit -1
fi

echo "Patching..."



echo ""
echo "Starting build script..."

sh /CygwinPrepare/build-Genode-toolchain.sh