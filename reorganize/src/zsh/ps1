
export PS1='\[\e[0;33m\]anshou@unixsuperhero:\[\e[0;36m\] \w'
export PROMPT_COMMAND="echo -ne '\033]0;unixsuperhero\007'"

#### do ssh before screen

## if you are connected remotely, change the prompt/title
if [[ -n $SSH_CONNECTION ]]
then
	export PS1='\[\e[0;33m\]anshou@unixsuperhero (ssh):\[\e[0;36m\] \w'
	export PROMPT_COMMAND="echo -ne '\033]0;unixsuperhero (ssh)\007'"
fi

#### do screen after ssh
#### because the screen session will be used from locally/remotely
#### regardless of where it was created from

## if you are in a screen session, change the prompt/title
if [[ -n $STY ]] #if [[ $TERM == 'screen' ]]
then
	export PS1="\[\e[0;33m\]anshou@screen (${STY##*.}.${WINDOW}):\[\e[0;36m\] \w"
	export PROMPT_COMMAND="echo -ne '\033]0;screen\007'"
fi

## if you are in a vim shell, change the prompt/title
if [[ -n $VIM ]]
then
	export PS1='\[\e[0;33m\]anshou@unixsuperhero (vim):\[\e[0;37m\] \w'
	export PROMPT_COMMAND="echo -ne '\033]0;unixsuperhero (vim)\007'"
fi

export PS1="$PS1 \$(git_prompt_info '(%s)')\n\[\e[0;31m\]\$(list_changes)\n\[\e[0;33m\]$> \[\e[0;0m\]"

if [[ -r ps1.sh ]]; then
	source ps1.sh
fi

