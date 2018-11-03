## const
PS1="\W $"
export CLICOLOR=1
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
export LESS='-MR'

## for symbolic link path
function readlink_f () {
  TARGET_FILE=$1

  while [ "$TARGET_FILE" != "" ]; do
      cd `dirname $TARGET_FILE`
      FILENAME=`basename $TARGET_FILE`
      TARGET_FILE=`readlink $FILENAME`
  done

  echo `pwd -P`/$FILENAME
}

## path
export GOPATH=$HOME/go
export TOOL_PATH=$HOME/development/tool
export RBENV_PATH=$HOME/.rbenv
export GOROOT=$(dirname $(dirname $(readlink_f /usr/local/bin/go)))

# migarte PATH
export PATH="$PATH:$GOPATH/bin:$RBENV_PATH/bin:$TOOL_PATH/bin:$HOME/bin:/usr/local/bin:/usr/local/opt/mysql@5.7/bin"

## rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

test -r ~/.bashrc && . ~/.bashrc

## for secret keys
test -r ~/.bash_profile_private && . ~/.bash_profile_private

