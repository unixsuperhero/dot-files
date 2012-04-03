#!/usr/bin/env sh

# Title: Ruby development environment for OS X (Lion)
# Author: Rogelio J. Samour
# Warning:
#   While it is unlikely any code below might damage your system,
#   it’s always a good idea to back up everything that matters to you
#   before running this script! Just in case. I am not responsible for
#   anything that may result from running this script. Proceed at
#   your own risk.
# License: See below

OSX_VERSION=$(sw_vers | grep ProductVersion | awk -F: '{print $2}')
JAVA_FOR_LION_URL=http://support.apple.com/downloads/DL1421/en_US/JavaForMacOSX10.7.dmg
JAVA_PACKAGE=$(pkgutil --pkgs=com.apple.pkg.JavaForMacOSX107)

if [[ $OSX_VERSION =~ "10.7*" ]]; then
  echo "You're not running OS X 10.7 (Lion)"
  read -p "This script is meant to be run on Lion!"
  exit 0
fi

if [ ! -f "/Developer/Library/uninstall-devtools" ]; then
  read -p "Please install Xcode and re-run this script"
  exit 0
fi

if [[ $JAVA_PACKAGE != "com.apple.pkg.JavaForMacOSX107" && $OSX_VERSION =~ "10.7*" ]]; then
  echo 'Installing java, believe it or not!'
  curl -L $JAVA_FOR_LION_URL -o /tmp/java.dmg
  sudo hdid /tmp/java.dmg
  sudo installer -pkg "/Volumes/Java for Mac OS X 10.7/JavaForMacOSX10.7.pkg" -target /
  sudo hdiutil detach "/Volumes/Java for Mac OS X 10.7"
else
  echo 'java already installed'
fi

if [ ! -f "$HOME/.ssh/id_rsa.pub" ]; then
  echo "Please enter your email: "
  read email
  ssh-keygen -t rsa -C "$email"
  cat $HOME/.ssh/id_rsa.pub
  cat $HOME/.ssh/id_rsa.pub | pbcopy
  read -p "Your public ssh key is in your pasteboard. Add it to github.com and hit Return"
fi

if ! command -v brew > /dev/null; then
  echo "Installing homebrew"
  sudo mkdir /usr/local > /dev/null
  sudo chown -R `whoami` /usr/local
  curl -L https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C /usr/local
fi

brew list git > /dev/null
if [[ "$?" -eq "1" ]]; then
  brew install git
fi

echo "Fixing samba streams on OS X"
echo "[default]" >  $HOME/Library/Preferences/nsmb.conf
echo "streams=no" >> $HOME/Library/Preferences/nsmb.conf

echo "Removing system gems"
sudo gem update --system > /dev/null
sudo gem clean > /dev/null

echo "Making .bash_profile source .bashrc"
echo '. "$HOME/.bashrc"' > $HOME/.bash_profile

echo "Homebrew is installing ack, ctags-exuberant, imagemagick, macvim, markdown, proctools and wget"
for app in ack ctags-exuberant imagemagick macvim markdown proctools wget; do
  brew list $app > /dev/null
  if [[ "$?" -eq "1" ]]; then
    brew install $app
  fi
done

echo "Preparing system for dotmatrix"
mkdir $HOME/hashrocket
cd $HOME/hashrocket
if [ ! -d "$HOME/hashrocket/dotmatrix" ]; then
  git clone https://github.com/hashrocket/dotmatrix.git
else
  cd dotmatrix
  git pull --rebase
fi

echo "Symlinking dotmatrix dotfiles"
test -f $HOME/.bashrc && mv $HOME/.bashrc{,.bak}
test -f $HOME/.vim && mv $HOME/.vim{,.bak}
test -f $HOME/.vimrc && mv $HOME/.vimrc{,.bak}
ln -nfs $HOME/hashrocket/dotmatrix/.bashrc $HOME/
ln -nfs $HOME/hashrocket/dotmatrix/.hashrc $HOME/
ln -nfs $HOME/hashrocket/dotmatrix/.vim $HOME/
ln -nfs $HOME/hashrocket/dotmatrix/.vimrc $HOME/
sh $HOME/hashrocket/dotmatrix/bin/vimbundles.sh

if [ ! -d $HOME/.rvm ]; then
  echo "Building rvm"
  curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer -o rvm-installer
  chmod +x rvm-installer
  ./rvm-installer --version head
  rm rvm-installer
  source "$HOME/.rvm/scripts/rvm"
fi

grep 'source "$HOME/.rvm/scripts/rvm"' $HOME/.bashrc.local > /dev/null
if [[ "$?" -ne "0" ]]; then
  echo "Enable rvm"
  echo 'if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi' >> $HOME/.bashrc.local
fi

grep 'source $rvm_path/scripts/completion' $HOME/.bashrc.local > /dev/null
if [[ "$?" -ne "0" ]]; then
  echo "rvm: Enable rvm completion"
  echo '[[ -r $rvm_path/scripts/completion ]] && source $rvm_path/scripts/completion' >> $HOME/.bashrc.local
fi

grep 'rvm_project_rvmrc_default' $HOME/.rvmrc > /dev/null
if [[ "$?" -ne "0" ]]; then
  echo "rvm: Enable switching to default / system ruby when leaving a directory"
  echo 'rvm_project_rvmrc_default=1' > $HOME/.rvmrc
fi

echo "Declare global gems"
cat > $HOME/.rvm/gemsets/global.gems <<GLOBALGEMS
hitch
dirty
github
GLOBALGEMS

rvm list strings | grep ruby-1.9.2 > /dev/null
if [[ "$?" -ne "0" ]]; then
  echo "rvm is installing ruby 1.9.2"
  rvm install 1.9.2 -C --enable-shared=yes
  rvm use 1.9.2 --default
fi

echo "Writing .gemrc"
cat > $HOME/.gemrc <<GEMRC
---
:benchmark: false
gem: --no-ri --no-rdoc
:update_sources: true
:bulk_threshold: 1000
:verbose: true
:sources:
- http://rubygems.org
:backtrace: false
GEMRC

brew list postgresql > /dev/null
if [[ "$?" -eq "1" ]]; then
  echo "Installing PostgreSQL"
  brew install postgresql
  brew cleanup; brew prune
  POSTGRESQL_VERSION=$(brew list postgresql | awk -F/ '{print $6}' | head -n 1)
  test -d /usr/local/var/postgres || initdb /usr/local/var/postgres
  test -d $HOME/Library/LaunchAgents || mkdir -p $HOME/Library/LaunchAgents
  test -f $HOME/Library/LaunchAgents/org.postgresql.postgres.plist &&
    launchctl unload -w $HOME/Library/LaunchAgents/org.postgresql.postgres.plist
  cp -f /usr/local/Cellar/postgresql/$POSTGRESQL_VERSION/org.postgresql.postgres.plist $HOME/Library/LaunchAgents/
  launchctl load -w $HOME/Library/LaunchAgents/org.postgresql.postgres.plist
else
  echo "PostgreSQL already installed"
fi

# Follow the same pattern for MySQL if you feel inclined.

# Here's how you'd install Mongo:

# brew list mongodb > /dev/null
# if [[ "$?" -eq "1" ]]; then
#   echo "Installing MongoDB"
#   brew install mongodb # if you want the latest version 2.x
#   brew install https://raw.github.com/mxcl/homebrew/6d46eec8cb6bdf6d6575f8272f12937ea64b8284/Library/Formula/mongodb.rb # if you want version 1.8.3
#   brew cleanup; brew prune
#   MONGODB_VERSION=$(brew list mongodb | awk -F/ '{print $6}' | head -n 1)
#   test -d $HOME/Library/LaunchAgents || mkdir -p $HOME/Library/LaunchAgents
#   test -f $HOME/Library/LaunchAgents/org.mongodb.mongod.plist &&
#     launchctl unload -w $HOME/Library/LaunchAgents/org.mongodb.mongod.plist
#   cp /usr/local/Cellar/mongodb/$MONGODB_VERSION/org.mongodb.mongod.plist $HOME/Library/LaunchAgents/
#   launchctl load -w $HOME/Library/LaunchAgents/org.mongodb.mongod.plist
# else
#   echo "MongoDB already installed"
# fi

echo "Finished."

# Copyright (c) 2011 Rogelio J. Samour

# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
