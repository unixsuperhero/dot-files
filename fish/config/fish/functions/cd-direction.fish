function cd-direction --description 'Toggle the __fish_cd_direction'
  if count $argv >/dev/null
    for i in (seq (count $argv))
      switch $argv[$i]
        case '-l' --l --li --lis --list
          echo "cd direction: $__fish_cd_direction"
          return 0
        case 'p' pr pre prev
          set -g __fish_cd_direction prev
          return 0
        case 'n' ne nex next
          set -g __fish_cd_direction next
          return 0
      end
		end
  end

  switch $__fish_cd_direction
    case 'prev'
      set -g __fish_cd_direction next
      return 0
    case 'next'
      set -g __fish_cd_direction prev
      return 0
  end
end
