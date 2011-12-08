
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

  alias ebash="sudo vim /private/etc/bashrc"
  alias sbash="source /private/etc/bashrc"

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

  alias gsf="gs"

# [ GIT REMINDER ALIASES ]

  # -------------------------------------------------------------------
  # SO THAT I KNOW THE COMMON ARGUMENTS I LIKE TO USE WITH THE COMMANDS
  # -------------------------------------------------------------------

    alias gitlogalias="git log --summary"
    alias gitlogalias="git log --name-only"
    alias gitlogalias="git log --name-status"

# -------------------------------------------------------------------------
# THE FOLLOWING ARE NOTES ABOUT ALIASES IN GENERAL OR SPECIFIC TO A COMMAND
# -------------------------------------------------------------------------

  ### the following two alias ls= cmds should be for lsc
  # 2010-06-15 20:24:24
  # current alias ls

    alias sample_lsc='ls -aCGF'

  # 2010-06-16 17:27:00 
  # after learning that -A == -a except that it excludes '.' and '..'

    alias sample_lsc='ls -ACGF'

alias turl='curl --socks5-hostname localhost:51892'
alias deliver="gp staging && gp"
