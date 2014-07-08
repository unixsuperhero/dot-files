#!/bin/bash

mkdir -pv $HOME/bin
export PATH=$HOME/bin:$PATH
cp git-stat-summarizer.rb git-stat-summary $HOME/bin/

cat <<HOWTO

USAGE:

  git stat-summary [...]

  # you can pass commit ranges or anything git
  # log normally accepts:
  #
  #   git stat-summary 234124..88fbfbb
  #   git stat-summary bc99783..
  #

HOWTO
