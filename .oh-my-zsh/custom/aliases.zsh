# General aliases
alias v='nvim'

# Git aliases
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -v'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
alias gpull='git pull origin $(git_current_branch)'
alias gpush='git push origin $(git_current_branch)'
alias gst='git status'
