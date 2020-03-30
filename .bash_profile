# load .bashrc
#if [ -f ~/.bashrc ]; then
   #source ~/.bashrc
#fi

# My bash_profile settings.
export EDITOR=vim
export VISUAL=vim

# ignore fg
HISTIGNORE="fg*"

# no duplicates or space-prefixed commands
HISTCONTROL=ignoreboth



# use vim to edit commands instead of emacs
# Uncomment if you want that.
# set -o vi

# bind c-f to bring back c-z app instead of fg
bind '"\C-f": "fg %-\n"'

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# aliases

alias sudo='sudo ' # allow aliases to work with sudo

alias path='echo -e ${PATH//:/\\n}'                           # display path
alias ll="ls -alh"                                            # show long list
alias irb='irb --readline -r irb/completion'                  # Make sure irb has readline and completion
alias tn='tmux new-session -s'                                # tmux new session
alias ta='tmux attach -t'                                     # tmux attach
alias tl='tmux ls'                                            # list
alias tk='tmux kill-session -s'                               # kill session name
alias tnu='unset TMPDIR && tmux new-session -s'               # tmux new but unset temp dir
alias tau='unset TMPDIR && tmux attach -t'                    # tmux attach but unset tmpdir for sockets
alias psr='ps -ef | grep'                                     # show long listing of processes
alias ep='vim ~/.bash_profile'                                # edit bash_profile
alias epp='vim ~/.bash_private'                                # edit private file
alias ev='vim ~/.vim/vimrc_main'                              # edit shared vim conf
alias evv='vim ~/.vim/vundle'                                 # edit vim plugins
alias evp='vim ~/.vim/vimrc_private'                          # edit private vim settings
alias rp='. ~/.bash_profile'                                  # reload bash profile
alias et='vim ~/.tmux.conf'                                   # edit tmux conf
alias md='mkdir -p'                                           # create folders with child folders
alias pastebin='curl -F c=@- https://ptpb.pw/'                # create a pastebin
alias update_vim="vim -u ~/.vim/.vundle +BundleInstall +qall" # update vim bundles
alias myip='curl icanhazip.com'                               # myip: Public facing IP Address
alias devtree="tree -aC -I '.git|node_modules|bower_components' --dirsfirst | less -FRX"

mostused() {
  history | awk '{c[$2]++}END{for(i in c){print c[i] " " i}}' | sort -rn | head;
}

# recursive directory listing
# alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

mcd () { mkdir -p "$1" && cd "$1"; }                          # Makes new Dir and jumps inside

# simple web server for current dir
alias server="python -m SimpleHTTPServer"


# Erlang/iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# TMUXINATOR
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# GIT
source ~/.git_completion.bash

# Prompt
DIRCOLOR="\[$(tput setaf 6)\]"
PROMPTCOLOR="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"
COLORED_PROMPT="\u@\h:${DIRCOLOR}\W\$(__git_ps1) ${PROMPTCOLOR}\$${RESET} "
UNCOLORED_PROMPT='\u@\h:\W$(__git_ps1 " (%s)") \$ '

PS1=$COLORED_PROMPT


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

  # add Ruby version to prompt
  PS1="[\$(~/.rvm/bin/rvm-prompt v g)] $PS1"
fi

# direnv
if hash direnv 2>/dev/null; then
  eval "$(direnv hook bash)"
else
  echo "direnv not installed."
fi

fd() {
  DIR=`find * -maxdepth 0 -type d -print 2> /dev/null | fzf-tmux` \
    && cd "$DIR"
}

dock() {
  eval $(docker-machine env $1)
}

dock_ip() {
  docker-machine ip $1
}


undock() {
  eval $(docker-machine env -u)
}


# ask for tmux but only if we're not in tmux
# if [[ -z "$TMUX" ]]; then
  # list tmux sessions
  # tmux list-sessions 2> /dev/null

  #echo "want tmux?"
  #read answer
  #if [[ $answer == "y" ]]; then
    # tmux new-session -A -s "$USER" && exit 0
  #fi
