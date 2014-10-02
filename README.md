linux_utils
===========

A collection of small helpful linux scripts

To properly use these scripts from the command line simply add the main directory to the path by adding <b>export PATH=$PATH:(path to repo)</b> to your .bashrc

If you'd rather link the scripts into a directory already in your path, you might have to make sure that the scripts can find the lib folder. You can achieve that by adding <b>export LINUX_UTILS_LIB=(path to lib folder)</b> to your .bashrc



currently included scripts:
* ddp - calls dd while displaying progress bar


currently included helper scripts:
* colors.sh - some bash color support
* require-lib.sh - prompts user to install a package if absent
