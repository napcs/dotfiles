# My dotfiles

These are my personal dotfiles and they're designed to
work on both OSX and Linux. This contains my custom
VIM setup that actually works on Windows as well.

* tmux
* vim
* ack
* a few simple tools I use including Git completion

Prerequisites
* Homebrew for OSX
* git
* vim
* tmux
* ctags

I don't recommend that you clone this repo and use it. It's fine to go through and look at my settings though.

## How My Setup Works

I set this up by cloning the entire thing to ~/Dropbox/dotfiles. I don't sync them across machines with Git - I just use Dropbox, and use Git to version and share them.

I then symlink things appropriately.

~~~
ln -nfs ~/Dropbox/dotfiles/.bash_profile ~/.bash_profile
ln -nfs ~/Dropbox/dotfiles/.bash_osx ~/.bash_osx
ln -nfs ~/Dropbox/dotfiles/.vimrc ~/.vimrc
ln -nfs ~/Dropbox/dotfiles/.vim ~/.vim
ln -nfs ~/Dropbox/dotfiles/.slate ~/.slate
ln -nfs ~/Dropbox/dotfiles/.gemrc ~/.gemrc
ln -nfs ~/Dropbox/dotfiles/.irbrc ~/.irbrc
ln -nfs ~/Dropbox/dotfiles/.git_completion.bash ~/.git_completion.bash
ln -nfs ~/Dropbox/dotfiles/.tmux.conf ~/.tmux.conf
ln -nfs ~/Dropbox/dotfiles/.tmux.osx.clipboard ~/.tmux.osx.clipboard
ln -nfs ~/Dropbox/dotfiles/.tmux.linux.clipboard ~/.tmux.linux.clipboard
ln -nfs ~/Dropbox/dotfiles/.ackrc ~/.ackrc

~~~

I also create a bin/ folder and symlink the files in bin/ in there.

~~~
mkdir -p ~/bin
ln -nfs ~/Dropbox/dotfiles/bin/battery ~/bin/battery
~~~

Once that's all set I use Vundle to install the vim plugins. I made an alias to keep this updated.

~~~
update_vim
~~~

Again, I don't recommend that you clone this and use it. It's not really designed for that.

### My keybindings

