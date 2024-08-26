if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

function move_to_trash () {
  for file in $@
  do
    echo /home/ooyama/trash/${file}_`now`
    mv -f $file /home/ooyama/trash/${file}_`now`
  done
}

function gbrm () {
  branch_to_remove=$(git rev-parse --abbrev-ref HEAD)
  main_branch=$(gb -r | grep HEAD | cut -b 25-)

  echo "=> git checkout $main_branch"
  git checkout $main_branch

  echo "\n\n=> Remove branch: $branch_to_remove"
  git branch -D $branch_to_remove
  git fetch -p

  echo "\n\n=> Update $main_branch"
  git pull
}

# Customize to your needs...
alias now='date "+%Y%m%d_%H%M"'
alias cnt="ls | wc -w"
alias p="pwd"
# alias rm="move_to_trash"
alias ga="git add"
alias gc="git commit -m"
alias gs="git status"
alias gb="git branch"
alias gbrm="gbrm"
alias gco="git checkout"
alias gcof="git branch -a | fzf | xargs git checkout"
alias gl="git log --oneline --graph --all -n 12"
alias gll="git log --oneline --graph --all"
alias gpo="git push -u origin HEAD"
alias gm="git merge"
alias gss="git stash save -u"
alias gsp="git stash pop"
alias gsl="git stash list"
alias -g C="| pbcopy"
alias -g G="| grep"
alias rld="source ~/.zshrc"
alias cpd="rsync -a --info=progress2"

alias ls='exa -al --icons --color=always --group-directories-first' # my preferred listing
alias la='exa -a --icons --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --icons --color=always --group-directories-first'  # long format
alias lt='exa -aT --icons --color=always --group-directories-first' # tree listing
alias cat="bat"
alias usage='du -h -d 1'

# open github remote repository
# gh command has "gh browse" subcommand, but it require sign in and doesn't work with gitlab repo.
alias ogrr="git remote get-url origin | sed -e 's/:/\//' -e 's/\.git$//' -e 's/^git@/https:\/\//' | xargs open -a 'Google Chrome'"
alias ogmr='git remote get-url origin | sed -e "s/:/\//" -e "s/\.git$//" -e "s/^git@/https:\/\//" | xargs -I {} open -a "Google Chrome" "{}/-/merge_requests?scope=all&state=all&source_branch=$(git rev-parse --abbrev-ref HEAD)"'

alias dpn="docker ps --format '{{.Names}}'"

# fzf option
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/takehisa/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/takehisa/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/takehisa/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/takehisa/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

