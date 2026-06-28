#! /bin/zsh

set -e

# ==============================
#  change default shell to zsh
# ==============================
chsh -s /bin/zsh



# ==============================
#  enable EPEL repository
# ==============================
sudo yum install -y epel-release



# ==============================
#  install command line tools
# ==============================
sudo yum install -y tmux

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo yum install -y gh

wget https://github.com/xxxserxxx/gotop/releases/download/v4.2.0/gotop_v4.2.0_linux_amd64.tgz
tar -xvzf ./gotop_v4.2.0_linux_amd64.tgz
sudo mv ./gotop /usr/local/bin
rm ./gotop_v4.2.0_linux_amd64.tgz

# eza is not available in CentOS repositories, so install the prebuilt binary
wget https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz
tar -xvzf ./eza_x86_64-unknown-linux-gnu.tar.gz
sudo mv ./eza /usr/local/bin
rm ./eza_x86_64-unknown-linux-gnu.tar.gz

sudo yum install -y bat

sudo yum install -y fzf

curl -sS https://starship.rs/install.sh | sh

sudo yum install -y tldr

# install zprezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

sudo yum install -y neofetch


# ==============================
#  github setting
# ==============================
git config --global user.name "toyama"
git config --global user.email "toyama@indeed.com"
git config --global core.editor vim



# ==============================
#  create symbolic link
# ==============================
ln -s ~/Code/dotfiles/.vimrc ~/.vimrc
ln -s ~/Code/dotfiles/.vim ~/.vim
ln -s ~/Code/dotfiles/.wezterm.lua ~/.wezterm.lua
ln -s ~/Code/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/Code/dotfiles/.zshrc ~/.zshrc



# ==============================
#  ssh setting
# ==============================
mkdir ~/.ssh
mv ./config ~/.ssh
