echo "Switching to home dir"
pushd ~

echo "Installing prereqs"
sudo apt-get install -y direnv build-essential libevent-dev libncurses-dev wget vim git  ack-grep exuberant-ctags ranger unzip

echo "Installing tmux"
mkdir tmp_tmux
pushd tmp_tmux
wget https://github.com/tmux/tmux-builds/releases/download/v3.6a/tmux-3.6a-linux-x86_64.tar.gz
tar -zxvf tmux-*.tar.gz
sudo mv tmux /usr/local/bin
popd
rm -rf tmp_tmux

echo "installing vale"
mkdir tmp_vale
pushd tmp_vale
wget https://github.com/errata-ai/vale/releases/download/v3.14.0/vale_3.14.0_Linux_64-bit.tar.gz
tar -zxvf vale_*.tar.gz
sudo mv ./vale /usr/local/bin/vale
popd
rm -rf tmp_vale


echo "installing Node.js"
curl -sL https://deb.nodesource.com/setup_25.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh
sudo apt install nodejs -y
sudo npm install --global yarn

echo "installing Ruby"
sudo apt install gnupg2
gpg2 --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash
rvm install ruby
gem install solargraph
gem install tmuxinator


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
ln -nfs ~/dotfiles/bin/battery ~/bin/battery
ln -nfs ~/dotfiles/.config/jrnl ~/.config/jrnl
ln -nfs ~/dotfiles/.config/direnv/ ~/.config/direnv
ln -nfs ~/dotfiles/.config/coc ~/.config/coc
ln -nfs ~/dotfiles/starship.toml ~/.config/starship.toml

echo "starship"
curl -sS https://starship.rs/install.sh > install.sh
sudo sh install.sh
rm install.sh

echo "set up Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
vim +PluginInstall +qall

echo "create dirs"
mkdir -p .vim/autoload
mkdir -p .vim/backup
mkdir -p tmp/backup

echo "install go"
wget https://go.dev/dl/go1.26.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.26.0.linux-amd64.tar.gz
rm go1.26.0.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bash_profile

echo "Returning to original destination"
popd

echo "reloading"
source ~/.bashrc
