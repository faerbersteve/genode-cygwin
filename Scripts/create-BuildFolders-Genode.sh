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

cd genode

echo "Building toolchain for $tool_chain_arch..."

tool/create_builddir linux_x86
tool/create_builddir nova_x86_32
tool/create_builddir nova_x86_64



