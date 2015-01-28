#!/bin/bash

. $HOME/bin/bash.library
. $HOME/bin/list.library

notes_dir=${NOTES_DIR:-$HOME/notes}

echo "notes_dir => $notes_dir"

cd "${notes_dir}"
case $1 in

  ('')
    echo
    echo "Next time add the name of the note you want want edit..."
    echo ;;


  #(-new | --new)
  ( -new | --new)
    newfilename="new/$(date +'%Y%m%d.%s')"
    vim "$newfilename" ;;

  (-g)
    garg="${@/-g/}"
    garg=${garg# }
    good_dirs="$(find . -type d -depth 1 | egrep -v 'nogrep|\.git|home|erlang')"
    egrep -RiI "$garg" $good_dirs | egrep -E '^.{1,200}$' ;;

  (-gl | --gl)
    garg="${@/-gl/}"
    garg=${garg# }
    good_dirs="$(find . -type d -depth 1 | egrep -v 'nogrep|\.git|home|erlang')"
    grep -RiIl "$garg" $good_dirs ;;

  (-dir | --dir)
    echo "${notes_dir}"
    exit ;;

  (-find | -f | --find)
    not='(erlang.api|home|.git|android-sdk-mac|DS_Store|nogrep)'
    ls -1 "${notes_dir}" | grep -vE "$not" | while read line
    do
      find -L "${notes_dir}/${line}" -type f | grep -vE "$not" | grep "$2"
    done ;;

  (-ls | --ls)
    #clear
    if [ -z ${notes_dir}/$2 ]
    then
      echo
      cd ${notes_dir}
      ls -GRp
    else
      echo
      ls -GRp ${notes_dir}/$2
      echo
    fi ;;

  (-cat | --cat)
    if [ -z $2 ]; then
      find . -type d -not -path '*.git*' -not -path 'home' -not -path '*nogrep*' -not -path '*erlang*api*' | column
      echo
    else
      shift
      ls -AFR $@   ### Used to be $2 then $* now $@
    fi ;;

  (-edit | --edit)
    vim $0 ;;

  (*)
    vim -O $@ ;;

esac

#exit 0


#  Changelog
#
#  [ 2010-02-15 21:43:13 ]
#    Removed all of the clear commands, because those commands are
#    not very unix-like, and go against typical reusability conventions.
#

