  # -------------------------------------------------------------------
  # SO THAT I KNOW THE COMMON ARGUMENTS I LIKE TO USE WITH THE COMMANDS
  # -------------------------------------------------------------------

cat <<"Explanation"

  Command Templates (Much like a command cheat sheet.)

    The following are aliases that are not public. (So to speak, change
  phrasing here...)

    They are aliases with the sole purpose of showing me the different
  possible groupings of options available for each command.

Explanation

    alias_name=git_log_cheat_sheet
    alias $alias_name="git log --summary"
    alias $alias_name="git log --name-only"
    alias $alias_name="git log --name-status"
    unalias $alias_name

    alias_name=ls_cheat_sheet
    alias $alias_name="ls -aCFG" # 2010-06-15 20:24:24
    alias $alias_name="ls -ACFG" # 2010-06-16 17:27:00 # after learning that -A == -a except that it excludes '.' and '..'
    unalias $alias_name

    alias_name=screen_cheat_sheet
    alias $alias_name="screen -ls"          # $eg> sls              # list screen sessions
    alias $alias_name="screen -e^Ss"        # $eg> subscreen        # not sure the purpose of this one
    alias $alias_name="screen -S"           # $eg> sS work          # start a new screen session, calling it "work"    #### start a new session with the given name
    alias $alias_name="screen -e^Ss -S"     # $eg> subsS daemons    # start "daemons", a new session, using ^s as the command key
    alias $alias_name="screen -x"           # $eg> sx work          # open "work", an existing screen session
    alias $alias_name="screen -e^Ss -x"     # $eg> subsx daemons    # open "daemons", with ^s as the command key
    unalias $alias_name

    alias_name=egrep_cheat_sheet
    alias $alias_name="egrep --color -I"
    alias $alias_name="egrep -IRin"
    alias $alias_name="egrep -IRil"
    unalias $alias_name

    alias_name=mail_cheat_sheet
    alias $alias_name="mail -f ~/mbox"
    unalias $alias_name


# -------
#  FACES
# -------
  alias ~_~="echo;echo ~_~;echo"
  alias ^_^="echo;echo ^_^;echo"

# ----------
#  COMMANDS
# ----------

  ##------ curl ------


    alias torcurl="curl -x 127.0.0.1:8118"

  ##------ bind ------

    alias bindls="bind -p | grep -v -e '^#' -e 'self-insert'"

  ##------ jobs ------

    alias j="jobs"
    alias job="jobs"

  ##---- ls ----

    alias ls="ls -ACG"
    alias lsl="ls -AlG"
    alias ls1="ls -A1G"
    alias lsdir="ls -ACGd */"
    alias ls1dir="ls -A1Gd */"
    alias lsldir="ls -AlGd */"

  ##-------- screen --------

    alias sls="screen -ls"
    alias sx="screen -x"
    alias sS="screen -S"

  ##-------- subscreen --------

    alias subscreen="screen -e^Ss"
    alias subsx="subscreen -x"
    alias subsS="subscreen -S"

  ##------ grep ------

    alias grep="egrep --color -I"
    alias grepn="egrep -IRin"
    alias grepl="egrep -IRil"

  ##------ mail ------

    alias mbox="mail -f ~/mbox"


# -----------------------
#  Windows Compatibility
# -----------------------

  alias dir="ls"

##--------- helpers ---------

  alias stamp="date +%s"
  alias timestamp="date +%s"
  alias myip="myips"

##--------------------- auto-correct typos ---------------------

  alias lsit="list"
  alias list-e="list -e"

##----------------------- configuration aliases -----------------------

  alias essh="vim ~/.ssh/config"
  alias vssh="cat ~/.ssh/config"
  alias lssh="less ~/.ssh/config"
  alias evim="vim ~/.vimrc"
  alias eapache="sudo vim /private/etc/apache2/httpd.conf"
  alias ehttpd="eapache"
  alias ewww="eapache"

  alias eirssi="sudo vim ~/.irssi/config"

  alias ebash="sudo vim $HOME/.bashrc.local"
  alias sbash="source $HOME/.bashrc.local"

  alias eprofile="sudo vim /private/etc/profile"
  alias sprofile="source /private/etc/profile"

  alias ealias="vim ~/aliases.sh"
  alias salias="source ~/aliases.sh"

##----------------- redgage aliases -----------------

  alias     rgdb="mysql -h internal.titan1.redgage.com -u office -p redgage"

  alias     zeus="ssh zeus"
  alias morpheus="ssh morpheus"
  alias      pro="ssh pro"
  alias    titan="ssh titan"
  alias   apollo="ssh apollo"



# [ GIT ALIASES ]

  alias git_aliases="alias | grep git"
  alias gsf="gs"
  alias gss="git status -s"

# -------------------------------------------------------------------------
# THE FOLLOWING ARE NOTES ABOUT ALIASES IN GENERAL OR SPECIFIC TO A COMMAND
# -------------------------------------------------------------------------


alias turl='curl --socks5-hostname localhost:51892'
alias deliver="gp && gp staging && heroku rake db:migrate --app saveology-admin-staging && heroku restart --app saveology-admin-staging"
alias gac="git add . ; git commit -v"
alias rdm="bundle exec rake db:migrate db:test:prepare"
alias columnize='column -c $COLUMNS | column -t'
