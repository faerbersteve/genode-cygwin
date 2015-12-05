#!/usr/bin/bash

echo "##################################################"
echo "###########  BUILD GENODE TOOLCHAIN  #############"
echo "##################################################"
echo ""

cd $HOME

if [ ! -f /CygwinPrepare/config ]; then
    echo "Config File missing"
	exit -1
fi

source /CygwinPrepare/config

if [ -z "$tool_chain_arch" ]; then
	echo "toolchain arch not defined"
	exit -1
fi

if [ ! -d /usr/local/genode-gcc ]; then

cd genode/tool

echo "Building toolchain for $tool_chain_arch..."

make -f ./tool_chain "$tool_chain_arch"

else

echo "toolchain already exists..."

fi



