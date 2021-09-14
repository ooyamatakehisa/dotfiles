#! /bin/zsh

# change default shell to zsh
chsh -s /bin/zsh

# install homebrew
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# create symbolic link
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# install zprezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# add .zshfile config to .zshfile used in zprezto
cat ./.zshrc >> ~/.zshrc

# install poweline font
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts && ./install.sh
cd .. && rm -rf fonts

# add config for github
git config --global user.name "ooyamatakehisa"
git config --global user.email "ooyamatakehisa@gmail.com"
git config --global core.editor vim
