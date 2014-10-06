#!/bin/bash
# Description:
# setup-ssh-key.sh - ssh key setup script
# usage: setup-ssh-key.sh [-key <key>]
# This script sets up an existing private key in the ~/.ssh/config file for 
# simple authentication with ssh services

# Script initialization
[ -z $LINUX_UTILS_LIB ] && LINUX_UTILS_LIB=$(dirname $0)/lib # Resolve libs
[ -d $LINUX_UTILS_LIB ] || {
  echo "can't find linux_utils/lib directory!"
  echo "possible fix: export \$LINUX_UTILS_LIB in .bashrc"
  exit 127
}

# Script start
source $LINUX_UTILS_LIB/colors.sh

# TODO remove after all bugs are fixed
yellow "Warning! Using unstable script version, which is not fully tested"

# Parse parameters

while [ $# -gt 0 ]; do
  case "$1" in
    "-key")
      shift && key="$1"
      ;;
    
    *) #Usage message
      echo "usage: $(basename $0) [-key <key>]"
      echo "-key  supplies the script with the path to the private key file."
      exit 0
      ;;  
  esac
  
  shift
done 


# Script logic

[ -z $key ] && {
  read -p "Please enter the path to the private key: " key 
}

[ -f $key ] || { #TODO why the hell is this check not working!?
  red "File '$key' does not exist."
  exit 1
}


# Read parameters
read -p "For which hostname/ip should the key be registered? (eg. github.com) " host
[ -z $host ] && { echo "aborted"; exit 0 }
read -p "Enter username to use for login: (or leave empty for no specific user)" user
read -p "Enter alias for the host (eg. 'git' to use 'ssh://git' or leave it empty) " name
[ -z $name ] && { name=$host }

# Write entry
conf=~/.ssh/config
echo "Host $name" >> $conf
[ "$name" != "$host" ] && { echo "  HostName $host" >> $conf }
[ -n $user ] && { echo "  User $user" >> $conf }
echo "  IdentityFile $key" >> $conf
green "Done."

