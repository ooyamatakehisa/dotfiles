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
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/toyama/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install tmux
brew install gh
brew install gotop
brew install eza
brew install bat
brew install fzf
$(brew --prefix)/opt/fzf/install
curl -sS https://starship.rs/install.sh | sh

brew install tldr

# install zprezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done


brew install neofetch

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
brew install raycast
brew install spotify

brew tap wez/wezterm
brew install --cask wez/wezterm/wezterm



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
ln -s ~/dotfiles/.wezterm.lua ~/.wezterm.lua
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.zshrc ~/.zshrc



# ==============================
#  ssh setting
# ==============================
mkdir ~/.ssh
mv ./config ~/.ssh
