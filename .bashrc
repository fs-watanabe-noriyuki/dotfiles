## init
eval "$(rbenv init -)"

## const
PS1="\W $"
export CLICOLOR=1
export LESS='-MR'

## path
export GOPATH=$HOME/.go
export TOOL_PATH=$HOME/development/tool
export RBENV_PATH=$HOME/.rbenv

## migarte PATH
export PATH=$PATH:$GOPATH/bin:$RBENV_PATH/bin:$TOOL_PATH/bin:$HOME/bin:/usr/local/bin

## Command Alias
alias ll='ls -altrh'

# TODO: init directory
alias work='cd ~/development/workspace'
alias data='cd ~/development/workspace/data'
alias tool="cd ~/development/tool"

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

