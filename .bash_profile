## const
PS1="\W $"
export CLICOLOR=1
export LESS='-MR'

## path
export GOPATH=$HOME/.go
export TOOL_PATH=$HOME/development/tool
export RBENV_PATH=$HOME/.rbenv

# migarte PATH
export PATH="$PATH:$GOPATH/bin:$RBENV_PATH/bin:$TOOL_PATH/bin:$HOME/bin:/usr/local/bin:/usr/local/opt/mysql@5.7/bin"

## rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

test -r ~/.bashrc && . ~/.bashrc

