# load .bashrc
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# My bash_profile settings.
export EDITOR=vim
export HISTIGNORE="fg*"

export VISUAL=vim

# use vim to edit commands instead of emacs
# Uncomment if you want that.
# set -o vi

# bind c-f to bring back c-z app instead of fg
bind '"\C-f": "fg %-\n"'

# aliases

alias sudo='sudo ' # allow aliases to work with sudo

alias path='echo -e ${PATH//:/\\n}'                           # display path
alias ll="ls -alh"                                            # show long list
alias irb='irb --readline -r irb/completion -rubygems'        # Make sure irb has rubygems and completion
alias tn='tmux new-session -s'                                # tmux new session
alias ta='tmux attach -t'                                     # tmux attach
alias tl='tmux ls'                                            # list
alias tk='tmux kill-session -s'                               # kill session name
alias tnu='unset TMPDIR && tmux new-session -s'               # tmux new but unset temp dir
alias tau='unset TMPDIR && tmux attach -t'                    # tmux attach but unset tmpdir for sockets
alias psr='ps -ef | grep'                                     # show long listing of processes
alias ep='vim ~/.bash_profile'                                # edit bash_profile
alias ev='vim ~/.vim/vimrc_main'                              # edit shared vim conf
alias evv='vim ~/.vim/vundle'                                 # edit vim plugins
alias evp='vim ~/.vim/vimrc_private'                          # edit private vim settings
alias rp='. ~/.bash_profile'                                  # edit bash profile
alias et='vim ~/.tmux.conf'                                   # edit tmux conf
alias md='mkdir -p'                                           # create folders with child folders
alias pastebin='curl -F c=@- https://ptpb.pw/'                # create a pastebin
alias update_vim="vim -u ~/.vim/.vundle +BundleInstall +qall" # update vim bundles
alias myip='curl icanhazip.com'                               # myip: Public facing IP Address

# recursive directory listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

mcd () { mkdir -p "$1" && cd "$1"; }                          # Makes new Dir and jumps inside

alias s="python -m SimpleHTTPServer"

# Erlang/iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# TMUXINATOR
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# GIT
source ~/.git_completion.bash

# Prompt
export CUSTOM_PROMPT='\[\033[38;5;10m\]\W\[\033[38;5;15m\]$(__git_ps1 " (%s)")\[\033[38;5;14m\] \$\[$(tput sgr0)\] '
export UNCOLORED_PROMPT='\W$(__git_ps1 " (%s)") \$ '

PS1=$CUSTOM_PROMPT

# Linux configuration
if [ -f ~/.bash_linux ]; then
   source ~/.bash_linux
fi

# Special OS specific stuff I need
if [ -f ~/.bash_osx ]; then
   source ~/.bash_osx
fi

# My private enviroment settings I don't share.
if [ -f ~/.bash_private ]; then
   source ~/.bash_private
fi

# RVM
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then
  source $HOME/.rvm/scripts/rvm
  PS1="[\$(~/.rvm/bin/rvm-prompt v g)] $PS1"
fi

# direnv
if hash direnv 2>/dev/null; then
  eval "$(direnv hook bash)"
else
  echo "direnv not installed."
fi

# ask for tmux but only if we're not in tmux
if [[ ! $TERM =~ screen ]]; then
  # list tmux sessions
  tmux list-sessions 2> /dev/null

  #echo "want tmux?"
  #read answer
  #if [[ $answer == "y" ]]; then
    #tmux && exit 0
  #fi

fi


