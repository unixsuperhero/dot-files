
set -U my_home "/Users/jearsh"

## Paths: ~/lists and ~/.listrc
# set -U l "$my_home/lists"  # export l="$HOME/lists"
set -U list_dir "$my_home/lists"  # export list_dir="$HOME/lists"
set -U lists_dir "$my_home/lists"  # export lists_dir="$HOME/lists"
set -U mylistrc "$my_home/.listrc"  # export mylistrc="$HOME/.listrc"

## Paths: ~/bin
set -U bin "$my_home/bin"  # export bin="$HOME/bin"
# set -U mybin "$my_home/bin"  # export mybin="$HOME/bin"

## s3 / s3sync env(s)
# set -U AWS_ACCESS_KEY_ID "1JGCQN7DF0SFABE4DBG2"
# set -U AWS_SECRET_ACCESS_KEY "mSp5FMTN0t7QBKqRS7vEFRHeN+tALyelTiv7MIVo"

# set -U rgvpn "173.203.44.236"


################## rails paths ##################

set v "app/views"
set m "app/models"
set c "app/controllers"
set t "features"

##################### repos #####################

# saveology="$HOME/Sites/saveology"
# iterator="$HOME/Sites/iterat.org"
# kikin="$HOME/Sites/kikin/"
# clit="$HOME/Sites/cli-tracker"
# funding="$HOME/Sites/funding"
# mag="$HOME/Sites/magazineco"

# export saveology iterator kikin clit funding mag


################## heroku apps ##################

# staging="saveology-admin-staging"
# admin="saveology-admin-production"
# deals="saveology-deals-production"
# production="$deals"

# export staging admin deals production


# BC ENVIRONMENT ARGS

set -U BC_ENV_ARGS "-l"

# [[ -d /usr/local/lib/node_modules ]] && set -U NODE_PATH /usr/local/lib/node_modules:$NODE_PATH
#set -U PATH $PATH:/Users/jearsh/Sites/node_speed_rps/node_modules/js2coffee/node_modules/.bin:/Users/jearsh/Sites/node_speed_rps/node_modules/js2coffee/bin
#set -U PATH $PATH:/Developer/usr/bin
