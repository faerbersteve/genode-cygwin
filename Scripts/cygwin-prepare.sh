#!/usr/bin/bash

echo "##################################################"
echo "#################  CYGWIN  #######################"
echo "##################################################"
echo ""

if [ ! -f /bin/wget ]; then
    echo "wget not found!"
	exit -1
fi

echo "Preparing cygwin..."
echo "	Installing apt-cyg"

wget rawgit.com/transcode-open/apt-cyg/master/apt-cyg
install apt-cyg /bin
rm apt-cyg

ln -sf /bin/apt-cyg /bin/apt-get

echo "Starting main prepare script..."

sh /CygwinPrepare/prepare.sh
