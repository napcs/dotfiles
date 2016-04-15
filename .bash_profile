# My bash_profile settings.
export EDITOR=vim
export HISTIGNORE="fg*"

bind '"\C-f": "fg %-\n"'


# aliases
alias dir="ls -alh"
alias update_vim="vim -u ~/.vim/.vundle +BundleInstall +qall"
alias irb='irb --readline -r irb/completion -rubygems'
alias rc='bundle exec rails console'
alias rcs='bundle exec rails console --sandbox'
alias rs='bundle exec rails server'
alias t='tmuxinator'
alias tn='tmux new-session -s'
alias ta='tmux attach -t'
alias tl='tmux ls'
alias tk='tmux kill-session -s'
alias tnu='unset TMPDIR && tmux new-session -s'
alias tau='unset TMPDIR && tmux attach -t'
alias psr='ps -ef | grep'
alias ep='vim ~/.bash_profile'
alias ev='vim ~/.vim/vimrc_main'
alias evv='vim ~/.vim/vundle'
alias evp='vim ~/.vim/vimrc_private'
alias rp='. ~/.bash_profile'
alias et='vim ~/.tmux.conf'
alias mkdir='mkdir -p'
alias pastebin='curl -F c=@- https://ptpb.pw/'

alias s="python -m SimpleHTTPServer"

# TMUXINATOR
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# GIT
source ~/.git_completion.bash
PS1='\W$(__git_ps1 " Branch:(%s)")\$ '

# RVM
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
PS1="[\$(~/.rvm/bin/rvm-prompt v g)] $PS1"

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



# ask for tmux but only if we're not in tmux
if [[ ! $TERM =~ screen ]]; then
  # list tmux sessions
  tmux list-sessions 2> /dev/null
  echo "want tmux?"
  read answer
  if [[ $answer == "y" ]]; then
    tmux && exit 0
  fi
fi
