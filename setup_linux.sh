#! /bin/zsh

# ==============================
#  change default shell to zsh
# ==============================
chsh -s /bin/zsh



# ==============================
#  install command line tools
# ==============================
# sudo apt install tmux
sudo apt install gh

wget https://github.com/xxxserxxx/gotop/releases/download/v4.2.0/gotop_v4.2.0_linux_386.tgz
tar -xvzf ./gotop_v4.2.0_linux_386.tgz
sudo mv ./gotop /usr/local/bin
rm ./gotop_v4.2.0_linux_386.tgz

sudo apt install eza
sudo apt install bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

sudo apt install fzf
$(brew --prefix)/opt/fzf/install
curl -sS https://starship.rs/install.sh | sh

sudo apt install tldr

# install zprezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

sudo apt install neofetch


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
