
source /private/etc/bashrc
source /Users/jearsh/exports.sh

# # System-wide .bashrc file for interactive bash(1) shells.
# 
# ### this was uncommented so that screen would read it
# #if [ -z "$PS1" ]; then
# #   return
# #fi
# 
# #PS1='\h:\W \u\$ '
# # Make bash check its window size after a process completes
# shopt -s checkwinsize
# 
# export HISTCONTROL=ignoredups
# export HISTIGNORE='history'
# export HISTSIZE=10000
# export HISTFILESIZE=10000
# export EDITOR="vim"
# 
# shopt -s histappend
# source ~/functions.sh
# source ~/aliases.sh
# 
# # [ System Preferences ]
# 
# # [ Bash ]
# 
# export PS1='\[\e[0;33m\]\u@mini:\[\e[0;36m\] \w\n\$> \[\e[0;0m\]'
# export PROMPT_COMMAND="echo -ne '\033]0;mini\007'"
# 
# 
# ## environment variables for bc (the calculator)
# export BC_ENV_ARGS="-q -l"
# 
# 
# ## if you are in a screen session, change the prompt/title
# if [[ $TERM == 'screen' ]]
# then
# 	export PS1='\[\e[0;33m\]\u@screen:\[\e[0;36m\] \w\n\$> \[\e[0;0m\]'
# 	export PROMPT_COMMAND="echo -ne '\033]0;screen\007'"
# fi
# 
# ## if you are connected remotely, change the prompt/title
# if [[ -n $SSH_CONNECTION ]]
# then
# 	export PS1='\[\e[0;33m\]\u@mini (ssh):\[\e[0;36m\] \w\n\$> \[\e[0;0m\]'
# 	export PROMPT_COMMAND="echo -ne '\033]0;mini (ssh)\007'"
# fi
# 
# ## if you are in a vim shell, change the prompt/title
# if [[ -n $VIM ]]
# then
# 	export PS1='\[\e[0;33m\]\u@mini (vim):\[\e[0;37m\] \w\n\$> \[\e[0;0m\]'
# 	export PROMPT_COMMAND="echo -ne '\033]0;mini (vim)\007'"
# fi
# 
# # only resize the terminal window if you are using Eterm (usually only at home)
# if [[ $TERM == 'Eterm' ]]
# then
# 	printf "\e[8;70;180;t"
# fi
