function echoeach --description "in: .config/fish/functions/echoeach.fish"
  set -l args
  set -l recursive 0
  for opt in $argv
    switch $opt
      case '-e' -ed -edi -edit --e --ed --edi --edit
        vim $HOME/.config/fish/functions/echoeach.fish
        return 0
      case '-r' -r --r --r -re -re --re --re -rec -res --rec --res -recu -reso --recu --reso -recur -resol --recur --resol -recurs -resolv --recurs --resolv -recursi -resolve --recursi --resolve -recursiv --recursiv -recursive --recursive
        set recursive 1
        continue
      case '-h' -he -hel -help --h --he --hel --help
        echo "
          echoeach --edit      # opens the source file that defines this function
          echoeach --help      # prints this menu
          echoeach --recursive # resolve any variables whose value is the name of another variable
                               # also, call `echoeach --recursive \$item` on any variables that are lists
        "
      case '*'
        set args $args $opt
    end
  end

  for a_param in $args
    set -l v $a_param

    if test $recursive = 0
      for bb in $v
        echo "$bb"
      end
    else
      if set -q $a_param
        set v $$a_param
      end

      if test (count $v) -gt 1
        echoeach -r $v
      else
        echo $v
      end
    end
  end
end
