#!/usr/bin/bash

echo "##################################################"
echo "###########  DOWNLOAD GENODE SOURCE  #############"
echo "##################################################"
echo ""

if [ ! -f /bin/git ]; then
    echo "git not found!"
	exit -1
fi

if [ ! -f /CygwinPrepare/config ]; then
    echo "Config File missing"
	exit -1
fi

source /CygwinPrepare/config

if [ -z "$genode_git" ]; then
    echo "Git Repo missing"
	exit -1
fi

cd $HOME

DOWNLOAD=1

if [ -d genode ]; then
  #Directory exists
  
  if [ -z "$override_sourcedir" ]; then
  
  echo "Genode is already cloned"
  echo 
  
  read -p "Do you want to remove the files and reload?" yn
    case $yn in
        [Yy]* ) rm -rf $HOME/genode; 
		
				break;;
        [Nn]* ) DOWNLOAD=0;;
        * ) echo "Please answer yes or no."; exit -1;;
    esac
	
   else
			if [ "$override_sourcedir" -eq 0 ]; then
			
			echo "Ignored that sourcecode already downloaded."
			 
			DOWNLOAD=0
		fi
	fi
fi

if [ $DOWNLOAD -eq 1 ]; then
echo "Downloading..."


git clone "$genode_git"

fi

echo ""
echo "Starting patch script..."

sh /CygwinPrepare/patch-Genode.sh
