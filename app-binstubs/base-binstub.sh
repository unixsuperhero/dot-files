#!/bin/zsh

function goto_repo() {
  [[ $(pwd) == "${APP_DIR}" ]] && return 0
  cd ${APP_DIR}
  source .rvmrc
}

function current_branch() {
  basename $(git symbolic-ref HEAD)
}

function app_name() {
  git remote -v | grep "^[^[:space:]]*${1}[^[:space:]]*[[:space:]]" | sed 's/.*://;s/\.git.*//' | head -1
}

case $1 in
  '')
    cat <<NOTES
      USAGE: saveology [-e <file>]

      What should the default behavior be?
        cd to ${APP_DIR}?
NOTES

    goto_repo
  ;;

  -edit | --edit) vim $0 ;;

  egit) goto_repo; vim .git/config ;;

  git) goto_repo; cat .git/config ;;

  console | con | c)
    goto_repo

    [[ $2 == 's' ]] && heroku run rails console -a $(app_name staging) && exit
    [[ $2 == 'a' ]] && heroku run rails console -a $(app_name admin) && exit
    [[ $2 == 'p' ]] && heroku run rails console -a $(app_name production) && exit
    script/rails console && exit
  ;;

  psql | pg | p)
    goto_repo

    [[ $2 == 's' ]] && heroku pg:psql -a $(app_name staging) && exit
    [[ $2 == 'a' ]] && heroku pg:psql -a $(app_name admin) && exit
    [[ $2 == 'p' ]] && heroku pg:psql -a $(app_name production) && exit
    psql ${APP_NAME}_development && exit
  ;;

  -e)
    cd ~/lists
    args=()
    for i ({2..$#@}) args[$(( $i - 1 ))]="apps/${APP_NAME}/$@[$i]"

    echo "Make any missing directories"
    for f ($args) mkdir -pv $(dirname $f)
    vim -O $args
  ;;

  *)
    cat <<NOTES
    ERROR: UNKNOWN COMMAND
    ERROR: UNKNOWN COMMAND

      USAGE: ${APP_NAME} [-e <file>]

      What should the default behavior be?
        cd to ${APP_DIR}?

    ERROR: UNKNOWN COMMAND
    ERROR: UNKNOWN COMMAND
NOTES
  ;;

esac
