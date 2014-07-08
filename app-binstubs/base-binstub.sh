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

  rake)
    goto_repo

    shift
    heroku run rake $@ -a $APP_NAME && exit
  ;;

  console | con | c)
    goto_repo

    heroku run rails console -a $APP_NAME && exit
  ;;

  psql | pg | p)
    goto_repo

    heroku pg:psql -a $APP_NAME && exit
  ;;

  *)
    cat <<NOTES
    ERROR: UNKNOWN COMMAND
    ERROR: UNKNOWN COMMAND

      USAGE: ${APP_NAME} [-e <file>]

      What should the default behavior be?
        cd to ${APP_DIR}?

    staging (c | con | console)
    staging (p | pg | psql)
    staging (rake) \$@

    ERROR: UNKNOWN COMMAND
    ERROR: UNKNOWN COMMAND
NOTES
  ;;

esac
