
set -x skip_file "$HOME/.skip_osx_defaults"
if not test -f $skip_file
  defaults write com.apple.Dock showhidden -bool YES
  defaults write com.apple.CrashReporter DialogType none
  defaults write com.apple.finder AppleShowAllFiles TRUE
  touch $skip_file
end

