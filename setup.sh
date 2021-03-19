#!/bin/bash

#Run this routine to link all configuration files to their proper locations

cwd=$(pwd)

echo " "
echo "######################################"
echo "      CONFIGURATION SETUP             "
echo "######################################"
echo " "

   echo "Linking vimrc"

   if [ -f -a $HOME/.vimrc ]; then
      echo "removing $HOME/.vimrc"
      rm $HOME/.vimrc
   fi

   ln -vfs $cwd/vim/vimrc $HOME/.vimrc


   echo "Linking vimrc and template files"
    #if [ -d -a  $HOME/.vim ]; then
    #      echo "removing $HOME/.vim"
    #      rm -rf $HOME/.vim
   #   fi

   ln -Fs $cwd/vim/ $HOME/.vim
   
   if [ $? != 0 ]; then
      echo "WARNING: something wrong with vimrc"
   fi

echo ""
echo "######################################"
echo ""

   echo "Linking bashrc"
   ln -vfs $cwd/bash/bashrc $HOME/.bashrc
   source $HOME/.bashrc
   
   if [ $? != 0 ]; then
      echo "WARNING: something wrong with bashrc"
   fi

echo ""
echo "######################################"
echo ""

   echo "Linking ipython startup"
   ln -vfs $cwd/ipython/startup.py $HOME/.ipython/profile_default/startup/startup.py
   
   if [ $? != 0 ]; then
      echo "WARNING: something wrong with ipython default"
   fi

echo ""
echo "######################################"
echo ""

if [ $? == 0 ]; then
   echo "SUCCESS! All is well"
fi

