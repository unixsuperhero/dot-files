
alias rrails='bundle exec rrails'

function _rails_command --description="in: rails.fish"
  if test -e "script/rails"
    ruby script/rails $argv
  else if test -e "bin/rails"
    bin/rails $argv
  else
    rails $argv
  end
end

#function _rake_command --description="in: rails.fish"
#  if test -e "bin/rake"
#    bin/rake $argv
#  else
#    rake $argv
#  end
#end

# alias rails='_rails_command'
# alias rake='_rake_command'

