
function _rails_command
  if test -e "script/rails"
    ruby script/rails $argv
  else if test -e "bin/rails"
    bin/rails $argv
  else
    rails $argv
  end
end

#function _rake_command
#  if test -e "bin/rake"
#    bin/rake $argv
#  else
#    rake $argv
#  end
#end

alias rails='_rails_command'

alias rake='_rake_command'

