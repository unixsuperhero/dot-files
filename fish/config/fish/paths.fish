
set fish_user_paths $HOME/bin $fish_user_paths
set fish_user_paths $HOME/bin/jshint/bin $fish_user_paths

set -U HEROKU_BINSTUB_PATH "$HOME/bin/app-binstubs"
set -U REMOTE_BINSTUB_PATH "./stubs"

set fish_user_paths $HEROKU_BINSTUB_PATH $fish_user_paths
set fish_user_paths $REMOTE_BINSTUB_PATH $fish_user_paths

set -U REPOS "$HOME/repos"
set -U YT_HISTORY_DIR "$REPOS/youtube-history"

