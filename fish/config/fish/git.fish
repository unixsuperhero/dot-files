# Aliases
alias g='git'
#compdef g=git
alias gst='git status'
#compdef _git gst=git-status
alias gd='git diff'
#compdef _git gd=git-diff
alias gdc='git diff --cached'
#compdef _git gdc=git-diff
alias gl='git pull'
#compdef _git gl=git-pull
alias gup='git pull --rebase'
#compdef _git gup=git-fetch
alias gp='git push'
#compdef _git gp=git-push
alias gd='git diff'
#gdv() { git diff -w "$@" | view - }
#compdef _git gdv=git-diff
alias gc='git commit -v'
#compdef _git gc=git-commit
alias gc!='git commit -v --amend'
#compdef _git gc!=git-commit
alias gca='git commit -v -a'
#compdef _git gc=git-commit
alias gca!='git commit -v -a --amend'
#compdef _git gca!=git-commit
alias gcmsg='git commit -m'
#compdef _git gcmsg=git-commit
alias gco='git checkout'
#compdef _git gco=git-checkout
alias gcm='git checkout master'
alias gr='git remote'
#compdef _git gr=git-remote
alias grv='git remote -v'
#compdef _git grv=git-remote
alias grmv='git remote rename'
#compdef _git grmv=git-remote
alias grrm='git remote remove'
#compdef _git grrm=git-remote
alias grset='git remote set-url'
#compdef _git grset=git-remote
alias grup='git remote update'
#compdef _git grset=git-remote
alias grbi='git rebase -i'
#compdef _git grbi=git-rebase
alias grbc='git rebase --continue'
#compdef _git grbc=git-rebase
alias grba='git rebase --abort'
#compdef _git grba=git-rebase
alias gb='git branch'
#compdef _git gb=git-branch
alias gba='git branch -a'
#compdef _git gba=git-branch
alias gcount='git shortlog -sn'
#compdef gcount=git
alias gcl='git config --list'
alias gcp='git cherry-pick'
#compdef _git gcp=git-cherry-pick
alias glg='git log --stat --max-count=10'
#compdef _git glg=git-log
alias glgg='git log --graph --max-count=10'
#compdef _git glgg=git-log
alias glgga='git log --graph --decorate --all'
#compdef _git glgga=git-log
alias glo='git log --oneline'
#compdef _git glo=git-log
alias glod='git log --oneline --decorate --graph'
#compdef _git glod=git-log
alias glodd='glod -10'
#compdef _git glodd=git-log
alias glog='glod --name-status'
#compdef _git glog=git-log
alias glogg='glod --name-status -10'
#compdef _git glogg=git-log
alias gss='git status -s'
#compdef _git gss=git-status
alias ga='git add'
#compdef _git ga=git-add
alias gm='git merge'
#compdef _git gm=git-merge
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gclean='git reset --hard; and git clean -dfx'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

#remove the gf alias
#alias gf='git ls-files | grep'

alias gpoat='git push origin --all; and git push origin --tags'
alias gmt='git mergetool --no-prompt'
#compdef _git gm=git-mergetool

alias gg='git gui citool'
alias gga='git gui citool --amend'
alias gk='gitk --all --branches'

alias gsts='git stash show --text'
alias gsta='git stash'
alias gstp='git stash pop'
alias gstd='git stash drop'

# Will cd into the top of the current repository
# or submodule.
alias grt='cd (git rev-parse --show-toplevel; or echo ".")'

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit; and git push github master:svntrunk'
#compdef git-svn-dcommit-push=git

alias gsr='git svn rebase'
alias gsd='git svn dcommit'
#
# Will return the current branch name
# Usage example: git pull origin (current_branch)
#
function current_branch --description="in: git.fish"
  set -x ref (git symbolic-ref HEAD 2> /dev/null); or set ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo $ref | sed 's/^refs\/heads\///'
end


function current_repository --description="in: git.fish"
  set -x ref (git symbolic-ref HEAD 2> /dev/null); or set ref (git rev-parse --short HEAD 2> /dev/null); or echo (git remote -v | cut -d':'f 2)
end

# these aliases take advantage of the previous function
alias ggpull='git pull origin (current_branch)'
#compdef ggpull=git
alias ggpur='git pull --rebase origin (current_branch)'
#compdef ggpur=git
alias ggpush='git push origin (current_branch)'
#compdef ggpush=git
alias ggpnp='git pull origin (current_branch); and git push origin (current_branch)'
#compdef ggpnp=git

# Pretty log messages
function _git_log_prettily --description="in: git.fish"
  if test -n $1
    git log --pretty=$1
  end
end

alias glp="_git_log_prettily"
#compdef _git glp=git-log

# Work In Progress (wip)
# These features allow to pause a branch development and switch to another one (wip)
# When you want to go back to work, just unwip it
#
# This function return a warning if the current branch is a wip
function work_in_progress --description="in: git.fish"
  git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"
  if $status == 0 then
    echo "WIP!!"
  end
end

# these alias commit and uncomit wip branches
alias gwip='git add -A; git ls-files --deleted -z | xargs -0 git rm; git commit -m "--wip--"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-"; and git reset HEAD~1'

# these alias ignore changes to file
alias gignore='git update-index --assume-unchanged'
alias gunignore='git update-index --no-assume-unchanged'
# list temporarily ignored files
alias gignored='git ls-files -v | grep "^[[:lower:]]"'



##############################
### FROM $HOME/.bashrc.git ###
##############################

# aliases

  alias git_aliases="alias | grep git"
  alias gsf="gs"
  alias gpa="gp --all"
  alias gpr="git pull --rebase"
  alias gprm="gpr origin master"
  alias gpremote="gp origin head"
  alias gpremotef="gp -f origin head"
  alias gst="git status"
  alias gss="gst -s"
  alias gcm="gc -m"
  alias gc-m="gcm"
  alias egcon="vim .git/config"
  alias gcon="cat .git/config"
  alias glodd="glod -9"
  alias glogg="glog -9"
  alias glr="glod --left-right"
  alias gra="git rebase --abort"
  alias grs="git rebase --skip"

  function testgrc --description="in: git.fish"
    echo
    echo before git grep call
    echo

    git --no-pager grep -Eil -e '^[<]{7}([^<]|$)' --and -e '^[=]{7}([^=]|$)' --and -e '^[>]{7}([^>]|$)'; and return -1
    echo git did not find any matches, which is a GOOD thing
    echo
    echo the following commands will be ran if no conflict lines were found
    echo ------------------------------------------------------------------
    echo git aa
    echo git rebase --continue
  end

  function grc --description="in: git.fish"
    git --no-pager grep -Eil -e '^[<]{7}([^<]|$)' --and -e '^[=]{7}([^=]|$)' --and -e '^[>]{7}([^>]|$)' --all-match; and return -1
    git aa
    git rebase --continue
  end

  function glodc --description="in: git.fish"
    if test (count $argv) -gt 0
      glod -9 $argv | cat
    else
      glod -9 | cat
    end
  end

  function glogc --description="in: git.fish"
    if test (count $argv) -gt 0
      glog -9 $argv | cat
    else
      glog -9 | cat
    end
  end

  function glmerge --description="in: git.fish"
    glr head...$1 | grep '^>'
    glr head...$1 | grep '^<'
  end

  function glrebase --description="in: git.fish"
    glr head...$1 | grep '^<'
    glr head...$1 | grep '^>'
  end

# functions

function qa1 --description="in: git.fish"
  set -x ref (git symbolic-ref HEAD 2> /dev/null); or set ref (git rev-parse --short HEAD 2> /dev/null); or return
  set -x current_branch (echo $ref | sed 's/refs.heads.//')
  set -x branch_root (echo $ref | sed 's/.*\///')
  set -x dev_branch "dev/$branch_root"
  git branch -D "$dev_branch"
  git checkout -b "$dev_branch"
  git checkout development
  git pull --rebase origin development
  git checkout "$dev_branch"
  if git rebase development
    echo "SUCCESSFUL: run `qa2`"
    echo "SUCCESSFUL: run `qa2`"
    echo "SUCCESSFUL: run `qa2`"
  else
    echo "set ref '$ref'" >dev_and_stage
    echo "set current_branch '$current_branch'" >>dev_and_stage
    echo "set branch_root '$branch_root'" >>dev_and_stage
    echo "set dev_branch '$dev_branch'" >>dev_and_stage
  end
end

function qa2 --description="in: git.fish"
  test -f dev_and_stage; and source dev_and_stage
  git checkout development
  git merge "$dev_branch"
  git push origin development
  git push staging head:master
  heroku run rake db:migrate -a beautified-staging
  git checkout "$current_branch"
  test -f dev_and_stage; and rm dev_and_stage
end

function dev_and_stage --description="in: git.fish"
  set -x skip 1
  if test -f dev_and_stage
    source dev_and_stage
    set -x skip 0
  else
    set -x ref (git symbolic-ref HEAD 2> /dev/null); or set ref (git rev-parse --short HEAD 2> /dev/null); or return
    set -x current_branch (echo $ref | sed 's/refs.heads.//')
    set -x branch_root (echo $ref | sed 's/.*\///')
    set -x dev_branch "dev/$branch_root"
    git branch -D "$dev_branch"
    git checkout -b "$dev_branch"
    git checkout development
    git pull --rebase origin development
    git checkout "$dev_branch"
    if git rebase development
      set -x skip 0
    else
      echo "set ref '$ref'" >dev_and_stage
      echo "set current_branch '$current_branch'" >>dev_and_stage
      echo "set branch_root '$branch_root'" >>dev_and_stage
      echo "set dev_branch '$dev_branch'" >>dev_and_stage
    end
  end

  if test $skip -eq 0
    git checkout development
    git merge "$dev_branch"
    git push origin development
    git push staging head:master
    heroku run rake db:migrate -a beautified-staging
    git checkout "$current_branch"
    test -f dev_and_stage; and rm -v dev_and_stage
  end
end

  function cleanup_branches --description="in: git.fish"
    gco master
    gpr
    git branch | sed 's/..//' | grep -v master | while read branch
      read -u 1 -p "$branch (y/n): " yn
      if test $yn = "y"
      then
        gco "$branch"
        gpr origin master
        gco master
        gb -d "$branch"
      else
        echo "Skipping $branch ..."
      end
    end
  end

  ## Have a searchable/parsable list of the files that have changed

  function gs --description="in: git.fish"

    if test -z $argv[1]
      git status -s | sed "s/...//;s/.* -> //" | sort -u
    else
      git status -s | sed "s/...//;s/.* -> //" | grep "$argv[1]" | sort -u
    end

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
  end

