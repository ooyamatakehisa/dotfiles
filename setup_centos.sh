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

# bat is not available in CentOS repositories, so install the prebuilt binary
wget https://github.com/sharkdp/bat/releases/download/v0.26.1/bat-v0.26.1-x86_64-unknown-linux-musl.tar.gz
tar -xvzf ./bat-v0.26.1-x86_64-unknown-linux-musl.tar.gz
sudo mv ./bat-v0.26.1-x86_64-unknown-linux-musl/bat /usr/local/bin
rm -rf ./bat-v0.26.1-x86_64-unknown-linux-musl ./bat-v0.26.1-x86_64-unknown-linux-musl.tar.gz

# fzf is not available in CentOS repositories, so install the prebuilt binary
wget https://github.com/junegunn/fzf/releases/download/v0.73.1/fzf-0.73.1-linux_amd64.tar.gz
tar -xvzf ./fzf-0.73.1-linux_amd64.tar.gz
sudo mv ./fzf /usr/local/bin
rm ./fzf-0.73.1-linux_amd64.tar.gz

curl -sS https://starship.rs/install.sh | sh

# tldr is not available in CentOS repositories, so install the tealdeer client as tldr
wget https://github.com/dbrgn/tealdeer/releases/download/v1.8.1/tealdeer-linux-x86_64-musl
sudo install -m 755 ./tealdeer-linux-x86_64-musl /usr/local/bin/tldr
rm ./tealdeer-linux-x86_64-musl

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
