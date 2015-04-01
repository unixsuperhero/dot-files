#!/Users/macbookpro/.rbenv/versions/2.1.0/bin/ruby

require 'pp'
require 'awesome_print'
require 'shellwords'
require 'fileutils'

class Notes
  def self.run(args)
    Notes.new(args).execute
  end

  attr_accessor :args, :previous_dir, :notes_dir

  def initialize(args)
    @args = args
    @previous_dir = Dir.pwd
    @notes_dir = ENV['NOTES_DIR'] || [ ENV['HOME'], 'notes' ].join(?/)
  end

  def execute
    cd_notes_dir
    system vim_command
    # ignore *.ignore.md files?
    # encrypt any files that need encrypting
    # auto-commit to the repo
    cd_previous_dir
  end

  def cd_notes_dir
    Dir.chdir @notes_dir
  end

  def secure_dirs(dir)
    dirs = dir.split('/')
    fname = dirs.pop
    dirs.map.with_index do |d,i|
      dirs.dup.tap do |t|
        t[i] += '.secure'
        t << fname
      end.join ?/
    end
  end

  def full_glob(f)
    pieces = f.split(?/)
    file = pieces.pop
    dirs = pieces.map{|d| format('%s{.secure,}', d) }
    File.join *(dirs.push(format('%s{,.secure}{.textile,.md}', file)))
  end

  def file_globs
    '{,**/}%s{.secure,}.{textile,md}'
  end

  def file_globs_expanded
    %w{
      %s.secure.textile
      %s.secure.md
      %s.textile
      %s.md
      **/%s.secure.textile
      **/%s.secure.md
      **/%s.textile
      **/%s.md
    }
  end

  def dir_globs
    %w{
      %s{.secure,}
    }
  end

  def dir_globs_expanded
    %w{
      %s.secure.md
      %s.md
    }
  end

  def possible_notes(arg)
    names = []
    names << '%s.secure.textile' % arg
    names << '%s.secure.md' % arg
    names += secure_dirs(arg).map{|d| '%s.secure.textile' % d }
    names += secure_dirs(arg).map{|d| '%s.secure.md' % d }
    names += secure_dirs(arg).map{|d| '%s.textile' % d }
    names += secure_dirs(arg).map{|d| '%s.md' % d }
    names << '%s.textile' % arg
    names << '%s.md' % arg
  end

  def expanded_args
    @expanded_args ||= args.map do |arg|
      Dir[full_glob( arg ), full_glob("**/#{arg}")].first || format('%s.md', arg)
    end
  end

  def vim_command
    pp expanded_args: expanded_args,
        escaped_args: expanded_args.dup.map(&Shellwords.method(:escape)),
          shell_join: Shellwords.join(expanded_args.dup),
        escaped_join: Shellwords.join(expanded_args.dup.map(&Shellwords.method(:escape)))

    "vim -O %s" % Shellwords.join(expanded_args)
  end

  def cd_previous_dir
    Dir.chdir @previous_dir
  end

  def cat?(file)
    File.directory?(file)
  end

  def note?(file)
    File.file?(sprintf('%s.md', file))
  end
end

if ARGV[0][/--?e(d(i(t)?)?)?/]
  system("vim %s" % __FILE__)
else
  Notes.run(ARGV)
end

__END__

    # pp shellwords: Shellwords.shellwords(args),
    #    shellsplit: Shellwords.shellsplit(args),
    #         split: Shellwords.split(args),
    #     shelljoin: Shellwords.shelljoin(args),
    #          join: Shellwords.join(args),
    #   shellescape: Shellwords.shellescape(args),
    #        escape: Shellwords.escape(args)

# ----------------------------------------------------------------------
# BELOW HERE WAS THE ORIGINAL (stripped down, slightly modified) VERSION
# ----------------------------------------------------------------------

. $HOME/bin/bash.library
. $HOME/bin/list.library

notes_dir=${NOTES_DIR:-$HOME/notes}

echo "notes_dir => $notes_dir"

cd "${notes_dir}"
case $1 in

  ('')
    echo
    echo "Next time add the name of the note you want want edit..."
    echo ;;


  #(-new | --new)
  ( -new | --new)
    newfilename="new/$(date +'%Y%m%d.%s')"
    vim "$newfilename" ;;

  (-g)
    garg="${@/-g/}"
    garg=${garg# }
    good_dirs="$(find . -type d -depth 1 | egrep -v 'nogrep|\.git|home|erlang')"
    egrep -RiI "$garg" $good_dirs | egrep -E '^.{1,200}$' ;;

  (-gl | --gl)
    garg="${@/-gl/}"
    garg=${garg# }
    good_dirs="$(find . -type d -depth 1 | egrep -v 'nogrep|\.git|home|erlang')"
    grep -RiIl "$garg" $good_dirs ;;

  (-dir | --dir)
    echo "${notes_dir}"
    exit ;;

  (-find | -f | --find)
    not='(erlang.api|home|.git|android-sdk-mac|DS_Store|nogrep)'
    ls -1 "${notes_dir}" | grep -vE "$not" | while read line
    do
      find -L "${notes_dir}/${line}" -type f | grep -vE "$not" | grep "$2"
    done ;;

  (-ls | --ls)
    #clear
    if [ -z ${notes_dir}/$2 ]
    then
      echo
      cd ${notes_dir}
      ls -GRp
    else
      echo
      ls -GRp ${notes_dir}/$2
      echo
    fi ;;

  (-cat | --cat)
    if [ -z $2 ]; then
      find . -type d -not -path '*.git*' -not -path 'home' -not -path '*nogrep*' -not -path '*erlang*api*' | column
      echo
    else
      shift
      ls -AFR $@   ### Used to be $2 then $* now $@
    fi ;;

  (-edit | --edit)
    vim $0 ;;

  (*)
    vim -O $@ ;;

esac

#exit 0


#  Changelog
#
#  [ 2010-02-15 21:43:13 ]
#    Removed all of the clear commands, because those commands are
#    not very unix-like, and go against typical reusability conventions.
#

