
set FISH_HOME "$HOME/.config/fish"

alias glod="git log --oneline --decorate"
alias glog='glod --name-status'
alias glogn='glod --name-only'

set -U VIMBUNDLES "$HOME/.vimbundles"

alias :e="vim"
alias :q="exit"

set -U EDITOR vim

source $FISH_HOME/paths.fish
source $FISH_HOME/osx_setup.fish
source $FISH_HOME/hashrc.fish
source $FISH_HOME/git.fish
source $FISH_HOME/rails.fish
source $FISH_HOME/functions.fish
source $FISH_HOME/aliases.fish
source $FISH_HOME/exports.fish

