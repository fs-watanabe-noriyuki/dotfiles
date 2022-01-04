## const
export CLICOLOR=1
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
export LESS='-MR'
export LANG=ja_JP.UTF-8
export PS1="\W $"

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
export GOROOT=$(dirname $(dirname $(readlink_f /usr/local/bin/go)))
export TOOL_PATH=$HOME/development/tool
export YARN_PATH=$HOME/.yarn
export PIP_PATH="$HOME/Library/Python/2.7"
export IMGMAGICK_PATH="$PATH:/usr/local/opt/imagemagick@6"
export ANYENV_PATH="$HOME/.anyenv"

## for bundle install mysql
## @see https://github.com/brianmario/mysql2/pull/1051
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

## java 1.8
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

## for ruby fork2
OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# migarte PATH
export PATH="$PATH:$GOPATH/bin:$ANYENV_PATH/bin:$YARN_PATH/bin:$TOOL_PATH/bin:$PIP_PATH/bin:$IMGMAGICK_PATH/bin:$HOME/bin:/usr/local/bin:/usr/local/opt/mysql@5.7/bin"

## anyenv
if which anyenv > /dev/null; then eval "$(anyenv init -)"; fi

## goenv
if which goenv > /dev/null; then eval "$(goenv init -)"; fi
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

test -r ~/.bashrc && . ~/.bashrc

## for secret keys
test -r ~/.bash_profile_private && . ~/.bash_profile_private

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.bash.inc" ]; then . "${HOME}/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.bash.inc" ]; then . "${HOME}/google-cloud-sdk/completion.bash.inc"; fi

