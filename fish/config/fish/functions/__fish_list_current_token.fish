function __fish_list_current_token --description 'List contents of token under the cursor if it is a directory, otherwise list the contents of the current directory'
	set val (eval echo (commandline -t))
	printf "\n"
	if test -d $val
		ls $val
	else
		set dir (dirname $val)
		if test $dir != . -a -d $dir
			ls $dir
		else
			ls
		end
	end

  # added by josh @ 2015-01-27 21:33:00
	printf "\n\n"

	commandline -f repaint
end
