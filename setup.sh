#!/bin/bash

#Run this routine to link all configuration files to their proper locations

echo ""
echo "######################################"
echo "      CONFIGURATION SETUP             "
echo "######################################"
echo ""

echo "Linking vimrc and template files"
ln -vfrs ./vim/vimrc $HOME/.vimrc
for i in $(ls ./vim/skeleton* | awk -F"/" '{print $NF}') ; do 
   ln -vfrs ./vim/$i $HOME/.vim/template/$i
done

if [ $? != 0 ]; then
   echo "WARNING: something wrong with vimrc"
fi

echo ""
echo "######################################"
echo ""

echo "Linking bashrc"
ln -vfrs ./bash/bashrc $HOME/.bashrc
source $HOME/.bashrc

if [ $? != 0 ]; then
   echo "WARNING: something wrong with bashrc"
fi

echo ""
echo "######################################"
echo ""

echo "Linking ipython startup"
ln -vfrs ipython/startup.py $HOME/.ipython/profile_default/startup/startup.py

if [ $? != 0 ]; then
   echo "WARNING: something wrong with ipython default"
fi

echo ""
echo "######################################"
echo ""


