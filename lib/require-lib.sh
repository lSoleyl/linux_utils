#!/bin/bash
# A small script, which checks whether a binary is present and if not,
# prompts the user to install it
# Usage require-lib.sh <binary> [packetname (if different)]

if [ -z $1 ]; then
  echo "Usage: $(basename $0) <binary> [packetname (if different)]"
else
  program=$1
  [ -z $2 ] && packet=$program || packet=$2
  
  which $program && exit 0 # Quit program if packet exists
  
  read -p "Packet $packet is missing, should it be installed now? (y/n)" yn
  if [ $yn == "y" ]; then
    sudo apt-get install $packet
    exit $?
  fi  
  exit 1
fi

