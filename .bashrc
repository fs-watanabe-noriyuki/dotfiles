## init
# eval "$(rbenv init -)"

## Command Alias
alias ll='ls -altrh'
alias ta='tmux a'

# TODO: init directory
alias dev='cd ~/work/develop'
alias data='cd ~/work/data/data'
alias tool="cd ~/work/tool"
alias dot="cd ~/dotfiles"

# Rails command
alias be='bundle exec'

# git command
alias co='git checkout'

# rubocop
alias rubocop_diff='rubocop $( git diff --cached --name-only --diff-filter=AMRC | grep -e ".*\.rb" | paste -s - )'

## peco
# ls and cd
function lscd {
   local dir="$( find . -maxdepth 1 -type d | sed -e 's;\./;;' | peco )"
   if [ ! -z "$dir" ] ; then
       cd "$dir"
   fi
}

## Bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

