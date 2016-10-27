#!/usr/bin/bash

echo "##################################################"
echo "#######  PREPARE LINUX/CYGWIN for GENODE  ########"
echo "##################################################"
echo ""

cd /CygwinPrepare

source /CygwinPrepare/config

if [ ! -f /bin/apt-get ]; then
    echo "apt-get not found!"
	exit -1
fi

if [ ! -f /bin/wget ]; then
    echo "wget not found!"
	exit -1
fi

if [ -z "$packagemirror" ]; then
    echo "Package Mirror missing"
	exit -1
fi

case "$(uname)" in
   CYGWIN*) cygwin=1 ;;
   *)       cygwin=0 ;;
esac


echo "Preparing for genode..."
echo "	Installing required tools"

apt-get install git
apt-get install make
apt-get install m4

if [ ! -f /usr/local/bin/autoconf ]; then
    if [ $cygwin -eq 1 ]; then
		#CYGWIN
		wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.64.tar.gz
		tar -xf autoconf-2.64.tar.gz 
		
		cd autoconf-2.64
		
		sh ./configure
		
		make 
		make install
		
		#leave dir
		
		cd ..
		
		rm -rf autoconf-2.64

		rm autoconf-2.64.tar.gz 
	else
		#LINUX
		apt-get install autoconf2.64
	fi
fi

apt-get install libncurses-devel
apt-get install texinfo-tex
apt-get install autogen
apt-get install gnupg
apt-get install libexpat-devel
apt-get install patch
apt-get install gcc-core
apt-get install gcc-g++

if [ ! -f /usr/local/bin/mawk ]; then
	if [ $cygwin -eq 1 ]; then
		#change mirror for package
		apt-get mirror ftp://ftp.cygwinports.org/pub/cygwinports
		apt-get install mawk
		
		#change to default
		apt-get mirror $packagemirror
	else
	
		echo "apt-get mawk nit implemented"
		exit 0
	fi
fi

apt-get install subversion-tools
apt-get install libxslt
apt-get install yasm


echo ""
echo "Starting download script..."

sh /CygwinPrepare/download-Genode.sh