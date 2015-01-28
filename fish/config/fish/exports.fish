
## -----------
## NEW EXPORTS
## -----------

set -x VIMRUNTIME /usr/share/vim/vim73

## -----------

set -xU my_home "/Users/jearsh"

## Paths: ~/lists and ~/.listrc
# set -U -x l "$my_home/lists"  # export l="$HOME/lists"
set -xU list_dir "$my_home/lists"  # export list_dir="$HOME/lists"
set -xU lists_dir "$my_home/lists"  # export lists_dir="$HOME/lists"
set -xU mylistrc "$my_home/.listrc"  # export mylistrc="$HOME/.listrc"

## Paths: ~/bin
set -xU bin "$my_home/bin"  # export bin="$HOME/bin"
# set -U -x mybin "$my_home/bin"  # export mybin="$HOME/bin"

## s3 / s3sync env(s)
# set -U -x AWS_ACCESS_KEY_ID "1JGCQN7DF0SFABE4DBG2"
# set -U -x AWS_SECRET_ACCESS_KEY "mSp5FMTN0t7QBKqRS7vEFRHeN+tALyelTiv7MIVo"

# set -U -x rgvpn "173.203.44.236"


################## rails paths ##################

set -x v "app/views"
set -x m "app/models"
set -x c "app/controllers"
set -x t "features"

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

set -xU BC_ENV_ARGS "-l"

# [[ -d /usr/local/lib/node_modules ]] && set -U -x NODE_PATH /usr/local/lib/node_modules:$NODE_PATH
#set -U -x PATH $PATH:/Users/jearsh/Sites/node_speed_rps/node_modules/js2coffee/node_modules/.bin:/Users/jearsh/Sites/node_speed_rps/node_modules/js2coffee/bin
#set -U -x PATH $PATH:/Developer/usr/bin
