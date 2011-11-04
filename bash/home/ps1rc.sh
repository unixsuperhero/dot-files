
export PS1='\[\e[0;33m\]\u@mini:\[\e[0;36m\] \w\n\$> \[\e[0;0m\]'
export PROMPT_COMMAND="echo -ne '\033]0;mini\007'"

#### do ssh before screen

## if you are connected remotely, change the prompt/title
if [[ -n $SSH_CONNECTION ]]
then
	export PS1='\[\e[0;33m\]\u@mini (ssh):\[\e[0;36m\] \w\n\$> \[\e[0;0m\]'
	export PROMPT_COMMAND="echo -ne '\033]0;mini (ssh)\007'"
fi

#### do screen after ssh
#### because the screen session will be used from locally/remotely
#### regardless of where it was created from

## if you are in a screen session, change the prompt/title
if [[ -n $STY ]] #if [[ $TERM == 'screen' ]]
then
	export PS1="\[\e[0;33m\]\u@screen (${STY##*.}.${WINDOW}):\[\e[0;36m\] \w\n\$> \[\e[0;0m\]"
	export PROMPT_COMMAND="echo -ne '\033]0;screen\007'"
fi

## if you are in a vim shell, change the prompt/title
if [[ -n $VIM ]]
then
	export PS1='\[\e[0;33m\]\u@mini (vim):\[\e[0;37m\] \w\n\$> \[\e[0;0m\]'
	export PROMPT_COMMAND="echo -ne '\033]0;mini (vim)\007'"
fi






