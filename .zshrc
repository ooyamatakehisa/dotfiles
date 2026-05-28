
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

# git branch -D previous
function gbdp () {
  git branch -D $(git rev-parse --abbrev-ref @{-1})
}

function cdf () {
  cd $(eza -a -h -D --time-style long-iso | fzf --preview="echo user={3} when={4}{5}; ls {-1}")
}

up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
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
alias gbdp="gbdp"
alias gco="git checkout"
alias gcof="git branch -a | fzf | xargs git checkout"
alias gl="git log --oneline --graph --all -n 12"
alias gll="git log --oneline --graph --all"
alias gpo="git push -u origin HEAD"
alias gm="git merge"
alias gss="git stash save -u"
alias gsp="git stash pop"
alias gsl="git stash list"
alias grh="git reset --hard"
alias -g C="| pbcopy"
alias -g G="| grep"
alias rld="source ~/.zshrc"
alias cpd="rsync -a --info=progress2"
alias amp='amp --visibility private'

alias ls='eza -al --icons --color=always --group-directories-first' # my preferred listing
alias la='eza -a --icons --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --icons --color=always --group-directories-first'  # long format
alias lt='eza -aT --icons --color=always --group-directories-first' # tree listing
alias cat="bat"
alias usage='du -h -d 1'
alias cdf="cdf"
alias zzz="pmset displaysleepnow"
alias sleep="pmset sleepnow"

# open github remote repository
# gh command has "gh browse" subcommand, but it require sign in and doesn't work with gitlab repo.
alias ogrr="git remote get-url origin | sed -e 's/:/\//' -e 's/\.git$//' -e 's/^git@/https:\/\//' | xargs open -a 'Google Chrome'"
# alias ogrr="git remote get-url origin | sed -e 's/:/\//' -e 's/\.git$//' -e 's/^git@code.us-east-2.indeed.tech/https:\/\/code.corp.indeed.com/' | xargs open -a 'Google Chrome'"
alias ogmr='git remote get-url origin | sed -e "s/:/\//" -e "s/\.git$//" -e "s/^git@/https:\/\//" | xargs -I {} open -a "Google Chrome" "{}/-/merge_requests?scope=all&state=all&source_branch=$(git rev-parse --abbrev-ref HEAD)"'
# alias ogmr='git remote get-url origin | sed -e "s/:/\//" -e "s/\.git$//" -e "s/^git@code.us-east-2.indeed.tech/https:\/\/code.corp.indeed.com/"| xargs -I {} open -a "Google Chrome" "{}/-/merge_requests?scope=all&state=all&source_branch=$(git rev-parse --abbrev-ref HEAD)"'
alias ogpr='git remote get-url origin | sed -e "s/:/\//" -e "s/\.git$//" -e "s/^git@/https:\/\//" | xargs -I {} open -a "Google Chrome" "{}/pulls?q=is:pr+head:$(git rev-parse --abbrev-ref HEAD)"'
alias ojira='open "https://indeed.atlassian.net/browse/$(git rev-parse --abbrev-ref HEAD | awk -F'/' "{print $3}")"'
# alias ojira2='open "https://indeed.atlassian.net/browse/$(git rev-parse --abbrev-ref HEAD | awk -F'/' '{print $2}')"'
alias ojira2='open "https://indeed.atlassian.net/browse/$(git rev-parse --abbrev-ref HEAD | awk -F"/" "{print \$2}")"'
alias sstm='ssh -t cvm tmux a -t 0'

alias dpn="docker ps --format '{{.Names}}'"
alias amp="amp --visibility private  --dangerously-allow-all"

function welcome () {
  BLUE='\033[1;36m'
NC='\033[0m' # No Color
echo ""
echo -e "  ${BLUE} __    __   ___ _        __  ___  ___ ___   ___      ____   ____    __ __  _     "
echo -e "  ${BLUE}|  |__|  | /  _| |      /  ]/   \|   |   | /  _]    |    \ /    |  /  |  |/ ]    "
echo -e "  ${BLUE}|  |  |  |/  [_| |     /  /|     | _   _ |/  [_     |  o  |  o  | /  /|  ' /     "
echo -e "  ${BLUE}|  |  |  |    _| |___ /  / |  O  |  \_/  |    _]    |     |     |/  / |    \     "
echo -e "  ${BLUE}|  \`  '  |   [_|     /   \_|     |   |   |   [_     |  O  |  _  /   \_|     \    "
echo -e "  ${BLUE} \      /|     |     \     |     |   |   |     |    |     |  |  \     |  .  |    "
echo -e "  ${BLUE}  \_/\_/ |_____|_____|\____|\___/|___|___|_____|    |_____|__|__|\____|__|\_|    ${NC}"                                                                    
echo ""
}
# neofetch
welcome


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

