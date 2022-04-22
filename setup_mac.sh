#! /bin/zsh

# ==============================
#  change default shell to zsh
# ==============================
chsh -s /bin/zsh



# ==============================
#  install command line tools
# ==============================
# install homebrew
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install tmux
brew install tmux

# install github commnad line tool
brew install gh

# install fzf
brew install fzf
$(brew --prefix)/opt/fzf/install

# install zprezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done



# ==============================
#  install GUI apps
# ==============================
brew install zoom
brew install docker
brew install google-chrome
brew install visual-studio-code
brew install slack
brew install google-japanese-ime
brew install notion
brew install alfred
brew install spotify



# ==============================
#  github setting
# ==============================
git config --global user.name "ooyamatakehisa"
git config --global user.email "ooyamatakehisa@gmail.com"
git config --global core.editor vim



# ==============================
#  create symbolic link
# ==============================
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.zshrc ~/.zshrc



# ==============================
#  ssh setting
# ==============================
mkdir ~/.ssh
mv ./config ~/.ssh
