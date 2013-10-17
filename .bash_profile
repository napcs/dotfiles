# My bash_profile settings.
export TERM="xterm-256color"
export EDITOR=vim
export HISTIGNORE="fg*"

bind '"\C-f": "fg %-\n"'

# aliases
alias update_vim="vim -u ~/.vim/.vundle +BundleInstall +qall"
alias irb='irb --readline -r irb/completion -rubygems'
alias rc='bundle exec rails console'
alias rcs='bundle exec rails console --sandbox'
alias rs='bundle exec rails server'
alias irc='irssi -n bphogan -c irc.freenode.net'
alias t='tmuxinator'
alias tn='unset TMPDIR && tmux new-session -s'
alias ta='unset TMPDIR && tmux attach -t'
alias migrate='rake db:migrate; db:test:prepare'
alias psr='ps -ef | grep'
alias ep='vim ~/.bash_profile'
alias ev='vim ~/Dropbox/dotfiles/.vim/vimrc_main'
alias rp='. ~/.bash_profile'
alias et='vim ~/.tmux.conf'

alias s="python -m SimpleHTTPServer"


# TMUXINATOR
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# GIT
source ~/.git_completion.bash
PS1='\W$(__git_ps1 " Branch:(%s)")\$ '

# RVM
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
PS1="\$(~/.rvm/bin/rvm-prompt v g) $PS1"

# Special OS specific stuff I need
if [ -f ~/.bash_linux ]; then
   source ~/.bash_linux
fi

if [ -f ~/.bash_osx ]; then
   source ~/.bash_osx
fi

# My private enviroment settings I don't share.
if [ -f ~/.bash_private ]; then
   source ~/.bash_private
fi

export PATH="~/bin:/opt/tmux/bin:/usr/local/bin:$PATH"
export PATH="/usr/local/share/npm/bin:/usr/local/heroku/bin:$PATH"
