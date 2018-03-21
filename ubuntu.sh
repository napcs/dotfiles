echo "Switching to home dir"
pushd ~

echo "Installing prereqs"
sudo apt-get install -y direnv build-essential libevent-dev libncurses-dev wget vim git  ack-grep exuberant-ctags ranger unzip

echo "Installing tmux"
wget https://github.com/tmux/tmux/releases/download/2.6/tmux-2.6.tar.gz
tar -zxvf tmux-2.6.tar.gz
pushd tmux-2.6
./configure
make
make install
popd
rm tmux-2.6.tar.gz
rm -rf tmux-2.6

echo "installing Node.js"
curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
rm nodesource_setup.sh
sudo apt-get -y install nodejs

echo "installing Ruby"
sudo apt install gnupg2
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
rvm install ruby-2.5


echo "Setting up bashrc"
ln -nfs ~/dotfiles/.bash_profile ~/.bash_profile
echo "source .bashrc" >> ~/.bash_profile
ln -nfs ~/dotfiles/.bash_osx ~/.bash_osx
ln -nfs ~/dotfiles/.vimrc ~/.vimrc
ln -nfs ~/dotfiles/.vim ~/.vim
ln -nfs ~/dotfiles/.gemrc ~/.gemrc
ln -nfs ~/dotfiles/.irbrc ~/.irbrc
ln -nfs ~/dotfiles/.git_completion.bash ~/.git_completion.bash
ln -nfs ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -nfs ~/dotfiles/.tmux.linux.clipboard ~/.tmux.linux.clipboard
ln -nfs ~/dotfiles/.ackrc ~/.ackrc
ln -nfs ~/dotfiles/.inputrc ~/.inputrc
ln -nfs ~/dotfiles/.config ~/.config
ln -nfs ~/dotfiles/bin/battery ~/bin/battery

echo "set up Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
vim +PluginInstall +qall

echo "create dirs"
mkdir -p .vim/autoload
mkdir -p .vim/backup
mkdir -p tmp/backup

echo "Returning to original destination"
popd
