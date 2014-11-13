#!/bin/bash
# Description: Kills any running chromium instance
# chrome-shutdown.sh - short description
# usage: chrome-shutdown.sh

# Script initialization
[ -z $LINUX_UTILS_LIB ] && LINUX_UTILS_LIB=$(dirname $0)/lib # Resolve libs
[ -d $LINUX_UTILS_LIB ] || {
  echo "can't find linux_utils/lib directory!"
  echo "possible fix: export \$LINUX_UTILS_LIB in .bashrc"
  exit 127
}

# Script start
source $LINUX_UTILS_LIB/colors.sh

if [ "$1" == "--help" ]; then
  echo "usage: $(basename $0)"
  echo "Just kills any running chromium instance"
  exit 0
fi



while pkill chromium; do
  echo "killing chromium..."
  sleep 1
done


