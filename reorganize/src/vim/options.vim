set visualbell
set wildmenu
set wildmode=list:longest,full
set splitright
set splitbelow
set hidden
set guifont=Monaco:h16
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=bash



set nowrap splitright splitbelow
set t_Co=256



set nolist                                        " (Show/Don't Show) special characters represententing whitespace
set nostartofline                                 " I have no ideal what this does right now....
set expandtab                                     " turn tabs into spaces (or: noexpandtab - do not turn tabs into spaces, a tab is a tab)
set shiftround                                    " Round indent to multiple of 'shiftwidth' for > and < commands
set tabstop=2                                     " Use 2 spaces for <Tab> and :retab
set shiftwidth=2                                  " Use 2 spaces for (auto)indent
set softtabstop=2                                 " added by josh, saw it in a different vimrc
set hidden                                        " Allow a modified buffer to be put in the bg, keeping the undo history, etc.
set incsearch                                     " Enable incremental search
set nohlsearch                                    " Don't highlight results of a search
set ignorecase                                    " Case insensitive search by default
set smartcase                                     " Disable 'ignorecase' if [A-Z] is in search query
set laststatus=2                                  " Always show status line, even for one window
set showcmd                                       " Show (partial) commands (or size of selection in Visual mode) in the status line
set number                                        " Show line numbers
set ruler                                         " Show line, column number, and relative position within a file in the status line
set nowrap                                        " don't word wrap
set linebreak                                     " If lines wrap, only wrap on whitespace. Don't split words in half.
set splitright                                    " When you :vs ... start on the right window, not the left
set backspace=indent,eol,start                    " Allow backspacing over everything
set nrformats=octal,hex,alpha                     " Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set scrolloff=0                                   " Scroll when cursor gets within 0 characters of top/bottom edge
set sidescrolloff=2                               " Scroll when cursor gets within 10 characters of left/right edge
set showmatch                                     " When a bracket is inserted, briefly jump to a matching one
set matchtime=2                                   " Jump to matching bracket for 2/10th of a second (works with showmatch)
set modeline modelines=5                          " Turn on # vim: set ft=markdown: style modelines
set wildmenu                                      " Use menu to show command-line completion (in 'full' case)
set wildmode=list:longest,full                    " Set command-line completion mode:
set history=1000                                  " Remember up to 1000 'colon' commmands and search patterns
set equalprg=bc                                   " cmd to use when you press = in visual mode
set mouse=a
set t_RV=                                         " Don't request terminal version string (for xterm)
set updatecount=50                                " Write swap file to disk after every 50 characters
set enc=utf-8                                     " Use UTF-8 as the default buffer encoding
set viminfo='200,\"100,/9000,:9000,n~/.viminfo    " Remember things between sessions
set backupskip=/tmp/*,/private/tmp/*"
set diffopt=filler,iwhite,vertical
set switchbuf=useopen,split
set spellfile=~/.vim/words.utf8.add
set formatprg=par\ -w60re

if has('persistent_undo')
  set undofile
  set undodir=~/.vim/tmp//,~/.vim/undo_files//,~/.vim//,/tmp//
endif

set nolist                                        " (Show/Don't Show) special characters represententing whitespace
