# My dotfiles

These are my personal dotfiles and they're designed to
work on both OSX and Linux. This contains my custom
VIM setup that actually works on Windows as well.

* tmux
* vim
* ack
* a few simple tools I use including Git completion

I don't recommend that you clone this repo and use it. It's fine to go through and look at my settings though.

###  Prerequisites

* Homebrew for OSX
* git
* vim
* tmux
* ctags
* On OSX, you'll need the app `reattach-to-user-namespace` in order to have good tmux support.
* A folder in your home called ~/tmp/backup


## How My Setup Works

I set this up by cloning the entire thing to ~/Dropbox/dotfiles. I don't sync them across machines with Git - I just use Dropbox, and use Git to version and share them.

So

    $ git clone https://github.com/napcs/dotfiles.git ~/Dropbox/dotfiles
    $ brew install git
    $ brew install vim
    $ brew install tmux
    $ brew install ctags
    $ brew install direnv
    $ brew install ack
    $ brew install ranger
    $ brew install reattach-to-user-namespace

Then create a folder for the Vim backup folder:

    $ mkdir -p ~/tmp/backup


Then create symlinks (soft links) to the files in the `~/Dropbox/dotfiles` folder:

~~~
ln -nfs ~/Dropbox/dotfiles/.bash_profile ~/.bash_profile
ln -nfs ~/Dropbox/dotfiles/.bash_osx ~/.bash_osx
ln -nfs ~/Dropbox/dotfiles/.vimrc ~/.vimrc
ln -nfs ~/Dropbox/dotfiles/.vim ~/.vim
ln -nfs ~/Dropbox/dotfiles/.slate ~/.slate
ln -nfs ~/Dropbox/dotfiles/.slate.js ~/.slate.js
ln -nfs ~/Dropbox/dotfiles/.gemrc ~/.gemrc
ln -nfs ~/Dropbox/dotfiles/.irbrc ~/.irbrc
ln -nfs ~/Dropbox/dotfiles/.git_completion.bash ~/.git_completion.bash
ln -nfs ~/Dropbox/dotfiles/.tmux.conf ~/.tmux.conf
ln -nfs ~/Dropbox/dotfiles/.tmux.osx.clipboard ~/.tmux.osx.clipboard
ln -nfs ~/Dropbox/dotfiles/.tmux.linux.clipboard ~/.tmux.linux.clipboard
ln -nfs ~/Dropbox/dotfiles/.ackrc ~/.ackrc
ln -nfs ~/Dropbox/dotfiles/.inputrc ~/.inputrc
ln -nfs ~/Dropbox/dotfiles/.config ~/.config

~~~

I also create a `bin/` folder and symlink the files in bin/ in there.

~~~
$ mkdir -p ~/bin
$ ln -nfs ~/Dropbox/dotfiles/bin/battery ~/bin/battery
~~~

Once that's all set I use Vundle to install the vim plugins. I made an alias to keep this updated.

~~~
$ update_vim
~~~

Again, I don't recommend that you clone this and use it. It's not really designed for that.

### My keybindings

#### Nerdtree

* `,d` opens and closes the tree
    * press `Enter` to open the file
    * press `i` to open the file in a split
    * press `m` when on a node to get the `menu` to add, delete, rename files.

#### CtrlP Fuzzy finder

* `,f` opens the search window. Type part of the filename to locate it.  
    * Press `Ctrl-K` and `Ctrl-j` to go up and down the list

#### NERDCommenter

* `,cc` comments out selected text
* `,cu` uncomments selected text

#### Ragtag

* `Ctrl-x /` in insert mode closes the open tag. Press again to close outer tag.

#### Misc

* `,<spacebar>` switches between the two most recent files
* `F2` toggles paste-mode insert.  Turn this on if you want to paste from your terminal to preserve formatting. Turn it off when done.
* `,sp` toggles spell check on and off.
* `,g` will attempt to launch the program for the current file
* `jj` in INSERT mode will exit INSERT mode and save the file
* `ii` in INSERT mode exits INSERT mode
