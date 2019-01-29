## Command Alias
alias ll='ls -altrh'

# TODO: init directory
alias dev='cd ~/work/develop'
alias data='cd ~/work/data'
alias tool="cd ~/work/tool"
alias dot="cd ~/dotfiles"

# Rails command
alias be='bundle exec'

# git command
alias co='git checkout'
alias ggpush='git push origin HEAD'

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

## tmux
alias tmuxbd="tmux new-session \; source-file ~/.tmux/bd_session"
