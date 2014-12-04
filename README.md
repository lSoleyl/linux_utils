linux_utils
===========

A collection of small helpful linux scripts

To properly use these scripts from the command line simply add the main directory to the path by adding `export PATH=$PATH:(path to repo)` to your .bashrc

If you'd rather link the scripts into a directory already in your path, you might have to make sure that the scripts can find the lib folder. You can achieve that by adding `export LINUX_UTILS_LIB=(path to lib folder)` to your .bashrc

These scripts have been developed on and for ubuntu, so it's not guaranteed they will work on other systems.

##Currently included scripts
* ddp - calls dd while displaying progress bar
* mdpdf - converts a .md (Markdown file) to a PDF file, using the nodejs module [markdown-pdf](https://www.npmjs.org/package/markdown-pdf). You must at least have **nodejs** and **npm** installed for this script to work.
* new-script.sh - generates a new linux_utils script template
* new-ssh-key.sh - generate new SSH-key-value pair and optionally setup the key
* setup-ssh-key.sh - adds existing SSH keys to the ~/.ssh/config to connect a key to a certain host.


##Currently included helper scripts:
* colors.sh - some bash color support
* require-lib.sh - prompts user to install a package if absent
