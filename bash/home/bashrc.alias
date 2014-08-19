
# <<"NOTES" >/dev/null
#   HOWTO: {Ignore,Skip,Bypass} an alias
#   <<-"bash script"
#     alias cp="cp -v"
#     cp $from $to    # cp with the -v option (uses the alias)
#     \cp $from $to   # cp without the -v option (bypasses the alias)
#   "bash script"
# 
#   EXPLANATION: (#1)
#     By starting the command with a backslash, '\', you are essentially escaping
#   the first character, which will not match the alias.  Any alpha (/[a-z]/)
#   character that is escaped, simply returns that character.  So, it's an
#   interesting way to bypass an alias.
# 
#   EXPLANATION: (#2)
#     Start the line with a backslash. ("\")  This basically escapes the first
#   letter in the command's name, which is just the character itself.
#   ("\j" == "j") So this way, you are running the same command, but the alias
#   matcher won't find a match.
# 
#     eg:
#       $> \cp /path/to/source /path/to/destination
#         ...instead of...
#       $> cp /path/to/source /path/to/destination
# NOTES

  # -------------------------------------------------------------------
  # SO THAT I KNOW THE COMMON ARGUMENTS I LIKE TO USE WITH THE COMMANDS
  # -------------------------------------------------------------------

# <<"Explanation" >/dev/null
# 
#   Command Templates (Much like a command cheat sheet.)
# 
#     The following are aliases that are not public. (So to speak, change
#   phrasing here...)
# 
#     They are aliases with the sole purpose of showing me the different
#   possible groupings of options available for each command.
# 
# Explanation

 #   alias_name=git_log_cheat_sheet
 #   alias $alias_name="git log --summary"
 #   alias $alias_name="git log --name-only"
 #   alias $alias_name="git log --name-status"
 #   alias $alias_name="git log --stat"
 #   unalias $alias_name

 #   alias_name=ls_cheat_sheet
 #   alias $alias_name="ls -aCFG" # 2010-06-15 20:24:24
 #   alias $alias_name="ls -ACFG" # 2010-06-16 17:27:00 # after learning that -A == -a except that it excludes '.' and '..'
 #   unalias $alias_name

 #   alias_name=screen_cheat_sheet
 #   alias $alias_name="screen -ls"          # $eg> sls              # list screen sessions
 #   alias $alias_name="screen -e^Ss"        # $eg> subscreen        # not sure the purpose of this one
 #   alias $alias_name="screen -S"           # $eg> sS work          # start a new screen session, calling it "work"    #### start a new session with the given name
 #   alias $alias_name="screen -e^Ss -S"     # $eg> subsS daemons    # start "daemons", a new session, using ^s as the command key
 #   alias $alias_name="screen -x"           # $eg> sx work          # open "work", an existing screen session
 #   alias $alias_name="screen -e^Ss -x"     # $eg> subsx daemons    # open "daemons", with ^s as the command key
 #   unalias $alias_name

 #   alias_name=egrep_cheat_sheet
 #   alias $alias_name="egrep --color -I"
 #   alias $alias_name="egrep -IRin"
 #   alias $alias_name="egrep -IRil"
 #   unalias $alias_name

 #   alias_name=mail_cheat_sheet
 #   alias $alias_name="mail -f ~/mbox"
 #   unalias $alias_name


# -------
#  FACES
# -------
#  alias ~_~="echo;echo ~_~;echo"
#  alias ^_^="echo;echo ^_^;echo"

# ----------
#  COMMANDS
# ----------

  ##------ curl ------

    alias torcurl="curl -x 127.0.0.1:8118"

  ##------ bind ------
  # list shell key bindings
    alias bindls="bind -p | grep -v -e '^#' -e 'self-insert'"

  ##------ jobs ------
  # list background jobs

    alias j="jobs"
    alias job="jobs"

  ##---- ls ----

    alias ls="ls -ACG"
  #  alias lsl="ls -AlG"
  #  alias ls1="ls -A1G"
  #  alias lsdir="ls -ACGd */"
  #  alias ls1dir="ls -A1Gd */"
  #  alias lsldir="ls -AlGd */"

  ##------ grep ------

    alias grep="egrep --color -I"
    alias grepn="egrep -IRin"
    alias grepl="egrep -IRil"

  ##------ pgrep & pkill ------

    alias pgrep="pgrep -ilf"
    alias pkill="pkill -ilf"

  ##------ mail ------

  #  alias mbox="mail -f ~/mbox"

  ##------ cp & mv ------

    alias cp="cp -v"      # verbosely show the files being copied
    alias mv="mv -v"      # verbosely show the files being moved

  ##-------- screen --------

  #  alias sls="screen -ls"
  #  alias sx="screen -x"
  #  alias sS="screen -S"

  ##-------- subscreen --------

  #  alias subscreen="screen -e^Ss"
  #  alias subsx="subscreen -x"
  #  alias subsS="subscreen -S"


# -----------------------
#  Windows Compatibility
# -----------------------

  # alias dir="ls"

##--------- helpers ---------

  alias stamp="date +%s"
  alias timestamp="date +%s"
  alias myip="myips"

##--------------------- auto-correct typos ---------------------

  alias lsit="list"
  alias list-e="list -e"

##----------------------- configuration aliases -----------------------

  alias essh="vim ~/.ssh/config"
  # alias vssh="cat ~/.ssh/config"
  # alias lssh="less ~/.ssh/config"
  alias evim="vim ~/.vimrc"
  alias ehosts="sudo vim /etc/hosts"
  # alias eapache="sudo vim /private/etc/apache2/httpd.conf"
  # alias ehttpd="eapache"
  # alias ewww="eapache"

  # alias eirssi="sudo vim ~/.irssi/config"

  alias ebash="vim $HOME/.{h,b}ashrc*"
  alias sbash="source $HOME/.bashrc"
  # function fbash () {
  #   ls -1d ~/.{h,b}ashrc* | grep -i $@
  # }
  # function gbash () {
  #   egrep -r $@ ~/.{b,h}ashrc*
  # }

  # alias eprofile="sudo vim /private/etc/profile"
  # alias sprofile="source /private/etc/profile"

  # alias ealias="vim ~/aliases.sh"
  # alias salias="source ~/aliases.sh"


# -------------------------------------------------------------------------
# THE FOLLOWING ARE NOTES ABOUT ALIASES IN GENERAL OR SPECIFIC TO A COMMAND
# -------------------------------------------------------------------------

# alias turl='curl --socks5-hostname localhost:51892'
# alias deliver="gp && (gp staging || gp -f staging) && heroku rake db:migrate --app saveology-admin-staging && heroku restart --app saveology-admin-staging"
# alias gac="git aa; gc -v"
# alias rdm="bundle exec rake db:migrate db:test:prepare"
# alias columnize='column -c $[$COLUMNS*2] | column -t'

# alias bunee="bundle exec"
# alias rami="bunee rake db:migrate db:test:prepare"
# alias migrate="bunee rake db:migrate db:test:prepare"

alias timestamp="date +%Y%m%d%H%M%S"
# alias time-stamp="date +%Y-%m-%d-%H-%M-%S"
# alias dateonly="date +%Y%m%d"
# alias date-only="date +%Y-%m-%d"
# alias timeonly="date +%H%M%S"
# alias time-only="date +%H-%M-%S"
# alias time:only="date +%H:%M:%S"

# alias merchant_emails='heroku rake vouchers:merchant_email --app saveology-admin-production'
# alias merchant_test_emails='heroku rake vouchers:merchant_test_email --app saveology-admin-production'

alias unhitch='hitch -u'
alias make_tags='ctags --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*'
alias make_pdf="cupsfilter -o fit-to-page -o cpi=18 -o lpi=11"

alias annotate="annotate -p before -e tests,fixtures"

alias savedb="psql -U jturner saveology_development"

alias vim="vim -O"
alias vimp="vim +set\ bt=nofile -"

# --------------------
# Tmux Pomodoro Stuff 
# --------------------

alias pomor="pomo_runner"
alias pomol="pomo_listener"
alias prun="pomo_runner"
alias prunner="pomo_runner"
alias plisten="pomo_listener"
alias plistener="pomo_listener"

