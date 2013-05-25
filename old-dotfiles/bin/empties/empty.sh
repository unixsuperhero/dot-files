#!/bin/bash

  cat <<HOW_TO_MAKE_THE_SCRIPT &>/dev/null

  There are a couple ways to make a skeleton script
file, using this script.

  From the command line:

    If saved as mkbashscript in env PATH:
      $> mkbashscript >/path/to/new_bash_script

    If in PATH, and edit with VIM:
      $> mkbashscript >/path/to/bin/new_script && vim /path/to/bin/new_script

    If in PATH, and edit with VIM:
      $> mkbashscript | vim -

    If file DOES have +x permission:
      $> ./path/to/this/file >/path/to/new_bash_script

    If file DOES NOT have +x permission:
      $> bash /path/to/this/file >/path/to/new_bash_script

  In VIM, open this file.  Then execute the following:

    :saveas /path/to/new_bash_script
    :%!bash
    :w

HOW_TO_MAKE_THE_SCRIPT

  cat <<SCRIPT_TEMPLATE
#!$(which bash)

cat <<META &>/dev/null

AUTHOR       : jearsh
NAME         : Joshua Toyota
DATE         : $(date +'%Y-%m-%d %H:%M:%S')
VERSION      : v0.1a

DESCRIPTION  :
  The script's description goes here...

TODO         :
  The To Do list goes here...

META

## Start writing the script here:

# ^_~

SCRIPT_TEMPLATE

