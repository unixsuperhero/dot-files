

function cleanup_branches ()
{
  gco master
  gpr
  git branch | sed 's/..//' | grep -v master |
  while read branch
  do
    read -u 1 -p "$branch (y/n): " yn
    if [[ $yn == "y" ]]
    then
      gco "$branch"
      gpr origin master
      gco master
      gb -d "$branch"
    else
      echo "Skipping $branch ..."
    fi
  done
}

## Have a searchable/parsable list of the files that have changed

function gs() {

  gst | sed "s/...//" | grep "$1" | sort -u

  #re='/Untracked/,$s/#[[:space:]]*([^ ]*$)/\1/p;s/.*: *//p'
  #case $1 in
  #  -h)
  #    cont='s/app.controllers.(.*)_controller.rb/Controller: \1/'
  #    view='s/app.views.(.*)[.]html.*/View: \1/'
  #    feat='s/features.(.*).feature/Test: \1/'
  #    git status | sed -En "$re" | grep "$2" | sed -E "/^$/d;$cont;$view;$feat" | sort -u ;;
  #  '' | *)
  #    git status | sed -En "$re" | grep "$1" | sed '/^$/d' | sort -u ;;
  #esac

  #git status | sed -n 's/.*:[^a-z]*//'
  #git status | grep -o ': .*' | sed 's/[^a-z]*//' | grep "$1" | sort -u
  #git status | sed -n 's/.*: *//p' | grep "$1" | sort -u
}

_setup_git () {
  [[ -d .git ]] || git init .
  git add .
  git commit -m 'initialize git'
}

repo_changed () {
  if [[ ! -d tmp ]]; then
    echo "making ./tmp in $(pwd)"
    mkdir tmp
  fi
  [[ $(git status --porcelain | wc -l | grep -o '[0-9]+') -gt 0 ]] && pwd >tmp/ps1 || cat /dev/null >tmp/ps1
  #cd $1 ### my change 2011-12-06 11:11:17
  #local g="$(git rev-parse --git-dir 2>/dev/null)"
  #if [ -n "$g" ]; then
  #  ### my change 2011-12-06 11:11:02 
  #  [[ $(git status --porcelain | wc -l | grep -o '[0-9]+') -gt 0 ]] &&
  #    echo -n "| ${1/$HOME/~} "
  #fi
}

list_repos() {
  for repo in ${repos//:/ }
  do
    echo "$repo"
  done
}

tracking_repo() {
  if ! list_repos | grep "$(pwd)$" >/dev/null
  then
    return 1
  fi
}

list_changes() {
  if tracking_repo; then
    repo_changed
  fi

  for repo in ${repos//:/ }; do
    ps1="${repo}/tmp/ps1"
    if [[ -e $ps1 ]]; then
      if [[ $(cat $ps1 | wc -c) -gt 0 ]]; then
        echo -n "| ${repo/$HOME/~} "
      fi
    fi
  done
  echo "|"
}

