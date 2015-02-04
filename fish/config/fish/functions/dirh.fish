function dirh --description 'Print the current directory history (the back- and fwd- lists)'
	
	if count $argv >/dev/null
		switch $argv[1]
			case -h --h --he --hel --help
				__fish_print_help dirh
				return 0
		end
	end

	# Avoid set comment
	set -l current (command pwd)
	set -l separator "\n"

	for i in $dirprev
		echo -n -e $i$separator
	end

	set_color $fish_color_history_current
	echo -n -e $current$separator
	set_color normal

    # BSD seq 0 outputs '1 0' instead of nothing
    if count $dirnext > /dev/null
        for i in (seq (echo (count $dirnext)) -1 1)
            echo -n -e $dirnext[$i]$separator
        end
    end

	echo
end
