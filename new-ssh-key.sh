#!/bin/bash
# Description:
# new-ssh-key.sh - short description
# usage: new-ssh-key.sh
# Detailed Description

# Script initialization
[ -z $LINUX_UTILS_LIB ] && LINUX_UTILS_LIB=$(dirname $0)/lib # Resolve libs
[ -d $LINUX_UTILS_LIB ] || {
  echo "can't find linux_utils/lib directory!"
  echo "possible fix: export \$LINUX_UTILS_LIB in .bashrc"
  exit 127
}

# Script start
source $LINUX_UTILS_LIB/colors.sh

# Script logic

echo "SSH key generator"

$LINUX_UTILS_LIB/require-lib.sh "ssh-keygen" "openssh" || {
  red "can't generate key, while openssh is missing"
  exit 1
}

read -p "Enter keyname (key will be created in ~/.ssh/<name>/): " keyname
if [ -z "$keyname" ]; then
  yellow "Keyname must be not empty. Aborting script"
  exit 0
fi 

if [ -d ~/.ssh/$keyname ]; then
  read -p "A key under that name already exists, should it be overwritten?(y/n) " yn
  if [ "$yn" != "y" ]; then
    yellow "Skipping key generation"
    skip="true"
  fi
fi

if [ -z $skip ]; then
  [ -d ~/.ssh/$keyname ] || mkdir ~/.ssh/$keyname
  read -p "What to write into the comment section? (eg. mail-adress, leave empty for default comment [user@hostname]) " comment
  [ -n "$comment" ] && comment=" -C $comment"
  
  
  #Remove old key
  [ -f ~/.ssh/${keyname}/id_rsa ] && {
    rm ~/.ssh/${keyname}/id_rsa
  }
  
  #Create the actual key
  ssh-keygen -f ~/.ssh/${keyname}/id_rsa${comment} || {
    red "ssh key creation seems to have failed."
    exit $?
  }
fi

read -p "Register key with a server in ~/.ssh/config? (y/n) " regkey
[ "$regkey" != "y" ] || {
  setup-ssh-key.sh -key ~/.ssh/$keyname/id_rsa
  exit $?
}






