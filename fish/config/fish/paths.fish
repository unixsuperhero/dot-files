
set -x fish_user_paths $HOME/bin $fish_user_paths
set -x fish_user_paths $HOME/bin/jshint/bin $fish_user_paths

set -xU HEROKU_BINSTUB_PATH "$HOME/bin/app-binstubs"
set -xU REMOTE_BINSTUB_PATH "./stubs"

set -x fish_user_paths $HEROKU_BINSTUB_PATH $fish_user_paths
set -x fish_user_paths $REMOTE_BINSTUB_PATH $fish_user_paths

set -xU REPOS "$HOME/repos"
set -xU YT_HISTORY_DIR "$REPOS/youtube-history"

