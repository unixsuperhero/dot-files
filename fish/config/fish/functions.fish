
function wifi_fix
  for a in "off" "on"
    networksetup -setairportpower en1 "$a"
  end
end

function extract_mp3
  if test -z $argv[1] -o test -z $argv[2]
    echo '2 params required.  (1) Original Video File (2) The Destination'
    return 1
  end
  ffmpeg -i $argv[1] -vn -ar 44100 -ac 2 -ab 192k -f mp3 $argv[2]
end

function wget
  echo "wget $argv" >>$HOME/wget-downloads.log
  command wget "$argv"
end

function itunes
  set opt $argv[1]
  switch $argv[1]
    case launch play pause stop rewind resume quit
    case mute
      set opt "set mute to true"
    case unmute
      set opt "set mute to false"
    case next previous
      set opt "$opt track"
    case '' -h --help
      echo "Usage: itunes <option>"
      echo "option:"
      echo "\tlaunch|play|pause|stop|rewind|resume|quit"
      echo "\tmute|unmute\tcontrol volume set"
      echo "\tnext|previous\tplay next or previous track"
      echo "\thelp\tshow this message and exit"
      return 0
  case '*'
      print "Unkonwn option: $opt"
      return 1
  end
  osascript -e "tell application \"iTunes\" to $opt"
end

function add_ssh_keys
  for a in $HOME/.ssh/*.pub
    ssh-add (echo $a | sed 's/.pub$//')
  end
end

function def
  # in fish, alias creates functions
  #   alias gd="git diff"
  #
  # is reviewed with:
  #   functions gd
  #
  #alias $argv[1] 2>/dev/null

  functions $argv[1] 2>/dev/null
  which -a $argv[1] 2>/dev/null
end

function ff
# Name: Fuzzy Finder for Bash
# Author: Joshua Toyota
# Created At: 2012-06-14 11:25:00
# Description:
#    Find files with a series of letters in the given order, but not necessarily next to each other.
# find . -type f | grep -i "$(echo "$1" | sed 's/./&.*/g')"

# Updated: 2013-01-24 09:38:19

  git ls-files "*"(echo $argv[1] | sed 's/./&*/g')
end

function vff
  vim (ff $argv[1])
end

function eman
  man $argv[1] | col -b | vim -
end

function myips
  echo
  for a in (ifconfig -l | grep -o '[^[:space:]]+')
    set ips (ifconfig "$a" | egrep -o '[0-9]{1,3}(\.[0-9]{1,3}){3}')
    if test (count $ips) -gt 0
    then
      echo "$a"
      echo "$ips" | sed 's/^/  /'
      echo
    end
  end

  echo
  echo "Remote IP:"
  echo "----------"
  whatismyip
  echo
end

function video_clip
  ffmpeg -i $argv[1] -ss $argv[2] -t $argv[3] $argv[4]
end

function video_concat
  echo >concat_files.txt
  for a in $argv
    echo "file '$a'" >>concat_files.txt
  end
  ffmpeg -f concat -i concat_files.txt -c copy concat.mp4
end

function video_nosubs
  ffmpeg -i $argv[1] -vf "crop=iw:ih-80:0:0" temp_nosub.mp4;
  ffmpeg -i temp_nosub.mp4 -vf "pad=640:368:0:0" $argv[2]
  rm temp_nosub.mp4
end
