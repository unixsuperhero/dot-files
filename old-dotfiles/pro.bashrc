alias j="jobs"
alias grepn="grep -Rin"
alias grepc="grep -Ric"
alias grepl="grep -Ril"
alias grepv="grep -v -e '\.svn' -e 'test22' -e 'new.content.php' -e 'josh2' -e 'tests' -e 'pcache' -e '\.swp' -e 'josh_cache.php' -e ':0\$'"
export sp="systems/public"
export spv="systems/public/views"
export sr="systems/redgage"
export srv="systems/redgage/views"
export js="public/assets/javascripts"
export css="public/assets/css"
cd $www
export PS1="\n\[\e[0;34m\]\u@pro.redgage:\[\e[0;36m\] \w\n\$> \[\e[0;0m\]"
export PROMPT_COMMAND="echo -ne '\033]0;pro.redgage\007'"
export design_repo="$HOME/work/repos/design"

if [[ ${SSH_CONNECTION%% *} == '65.7.216.129' ]]
then
	printf "\e[8;70;260;t"
fi

$HOME/bin/clockin
trap "${HOME}/bin/clockout" EXIT

if [[ -n $STY ]]
then
	export PS1="\n\[\e[0;34m\](${STY#*.}.${WINDOW}) \u@pro.redgage:\[\e[0;36m\] \w\n$> \[\e[0;0m\]"
fi

