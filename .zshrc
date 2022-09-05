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

# Customize to your needs...
alias now='date "+%Y%m%d_%H%M"'
alias cnt="ls | wc -w"
alias p="pwd"
# alias rm="move_to_trash"
alias ga="git add"
alias gc="git commit -m"
alias gs="git status"
alias gb="git branch"
alias gco="git checkout"
alias gl="git log --oneline --graph"
alias gp="git push origin"
alias gm="git merge"
alias gss="git stash save -u"
alias -g C="| pbcopy"
alias -g G="| grep"
alias rld="source ~/.zshrc"

alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing

# fzf option
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/takehisa/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/takehisa/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/takehisa/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/takehisa/google-cloud-sdk/completion.zsh.inc'; fi

