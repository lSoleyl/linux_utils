#!/bin/bash
#Import this to use color commands

nc="\e[0m"

function red {
 echo -e "\e[1;31m${1}${nc}"
}

function green {
 echo -e "\e[1;32m${1}${nc}"
}

function yellow {
  echo -e "\e[1;33m${1}${nc}"
}
