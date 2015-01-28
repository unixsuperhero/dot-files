
set -x FISH_HOME "$HOME/.config/fish"

alias glod="git log --oneline --decorate"
alias glog='glod --name-status'
alias glogn='glod --name-only'

set -xU VIMBUNDLES "$HOME/.vimbundles"

alias :e="vim"
alias :q="exit"

set -xU EDITOR vim

source $HOME/.config/fish/paths.fish
source $HOME/.config/fish/osx_setup.fish
source $HOME/.config/fish/hashrc.fish
source $HOME/.config/fish/git.fish
source $HOME/.config/fish/rails.fish
source $HOME/.config/fish/functions.fish
source $HOME/.config/fish/aliases.fish
source $HOME/.config/fish/exports.fish

