echo "Switching to home dir"
pushd ~

mkdir -p tmp/backup
mkdir -p ~/bin
mkdir -p ~/.config

echo "xcode install"
xcode-select install

echo "install homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "apple settings"
# show hidden files
defaults write com.apple.finder AppleShowAllFiles YES;

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# zoom full screen
defaults write com.apple.universalaccess closeViewZoomMode -int 0

# zoom follow the pointer
defaults write com.apple.universalaccess closeViewPanningMode -int 0


echo "Installing software"
brew install vim git subversion ack ctags ranger unzip direnv starship tree fzf pandoc wget

/opt/homebrew/opt/fzf/install

echo "Installing tmux"
brew install tmux

echo "installing Node.js"
brew install node yarn

echo "installing Ruby"
brew install gnupg
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
\curl -sSL https://get.rvm.io | bash -s stable
rvm install ruby-3.0.1


echo "installing window manager"
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd


echo "Setting up bashrc"
ln -nfs ~/Dropbox/dotfiles/.bash_profile ~/.bash_profile
ln -nfs ~/Dropbox/dotfiles/.bash_osx ~/.bash_osx
ln -nfs ~/Dropbox/dotfiles/.vimrc ~/.vimrc
ln -nfs ~/Dropbox/dotfiles/.vim ~/.vim
ln -nfs ~/Dropbox/dotfiles/.gemrc ~/.gemrc
ln -nfs ~/Dropbox/dotfiles/.irbrc ~/.irbrc
ln -nfs ~/Dropbox/dotfiles/.gitconfig ~/.gitconfig
ln -nfs ~/Dropbox/dotfiles/.git_completion.bash ~/.git_completion.bash
ln -nfs ~/Dropbox/dotfiles/.tmux.conf ~/.tmux.conf
ln -nfs ~/Dropbox/dotfiles/.tmux.linux.clipboard ~/.tmux.linux.clipboard
ln -nfs ~/Dropbox/dotfiles/.ackrc ~/.ackrc
ln -nfs ~/Dropbox/dotfiles/.inputrc ~/.inputrc
ln -nfs ~/Dropbox/dotfiles/.config/jrnl ~/.config/jrnl
ln -nfs ~/Dropbox/dotfiles/.config/direnv/ ~/.config/direnv
ln -nfs ~/Dropbox/dotfiles/.config/coc ~/.config/coc
ln -nfs ~/Dropbox/dotfiles/bin/battery ~/bin/battery
ln -nfs ~/Dropbox/dotfiles/starship.toml ~/.config/starship.toml
ln -nfs ~/Dropbox/dotfiles/.skhdrc ~/.skhdrc
ln -nfs ~/Dropbox/dotfiles/.yabairc ~/.yabairc

echo "create dirs"
mkdir -p .vim/autoload
mkdir -p .vim/backup

echo "set up Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
vim +PluginInstall +qall


echo "install coc"

echo "Compiling"
pushd Dropbox/dotfiles/.vim/bundle/coc.nvim
yarn install
popd

echo "installing plugins"
vim +'CocInstall -sync coc-html coc-css coc-tsserver coc-go' +qall

echo "Returning to original destination"
popd
