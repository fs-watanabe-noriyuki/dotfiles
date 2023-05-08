## const
export CLICOLOR=1
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
export LESS='-MR'
export LANG=ja_JP.UTF-8
export PS1="\W $"
export ENV=develop

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
export TOOL_PATH=$HOME/development/tool
export YARN_PATH=$HOME/.yarn
export PIP_PATH="$HOME/Library/Python/2.7"
export IMGMAGICK_PATH="/opt/homebrew/opt/imagemagick@6"
export ANYENV_PATH="$HOME/.anyenv"
export BREW_PATH=/opt/homebrew

## for bundle install mysql
## @see https://github.com/brianmario/mysql2/pull/1051
export OPENSSL_PATH=/opt/homebrew/opt/openssl@3
export LIBRARY_PATH=:$OPENSSL_PATH/lib
export LDFLAGS="-L$OPENSSL_PATH/lib"
export CPPFLAGS="-I$OPENSSL_PATH/include"
export LD_LIBRARY_PATH="$OPENSSL_PATH/lib"

## java 11
export JAVA_HOME=$(/usr/libexec/java_home -v 11)

## android
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_TOOL_PATH=$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools

## for ruby fork2
OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# migarte PATH
export PATH="$OPENSSL_PATH/bin:$PATH:$ANYENV_PATH/bin:$YARN_PATH/bin:$TOOL_PATH/bin:$PIP_PATH/bin:$IMGMAGICK_PATH/bin:$HOME/bin:$BREW_PATH/bin:/usr/local/bin:/opt/homebrew/opt/mysql@5.7/bin:$ANDROID_TOOL_PATH"

## anyenv
if which anyenv > /dev/null; then eval "$(anyenv init -)"; fi

## goenv
if which goenv > /dev/null; then eval "$(goenv init -)"; fi
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.anyenv/envs/goenv/bin"

test -r ~/.bashrc && . ~/.bashrc

## for secret keys
test -r ~/.bash_profile_private && . ~/.bash_profile_private

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi

# for react-native
export REACT_EDITOR=code
