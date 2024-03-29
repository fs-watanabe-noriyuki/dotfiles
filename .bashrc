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
alias ggpush='if [ -z "`git branch --contains | grep -e develop -e master`" ]; then git push origin HEAD; else echo "hey, this branch is protected"; fi'

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

# snowsql
alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql

## aws cli with localstack
alias awsl='aws --endpoint-url http://localhost:4566'

