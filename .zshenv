# const
export CLICOLOR=1
export LESSOPEN='| /opt/homebrew/Cellar/source-highlight/3.1.9_5/bin/src-hilite-lesspipe.sh %s'
export LESS='-MR'
export LANG=ja_JP.UTF-8
export PS1="\W $"
export ENV=develop


## path

### add PATH avoiding dup
add_to_path() {
  for p in "$@"; do
    if [[ ":$PATH:" != *":$p:"* ]]; then
      export PATH="$p:$PATH"
    fi
  done
}

add_to_path $HOME/bin:/usr/local/bin

### homebrew
export BREW_PATH=/opt/homebrew
add_to_path $BREW_PATH/bin

### tools
add_to_path $HOME/development/tool/bin

### yarn
add_to_path $HOME/.yarn/bin

### anyenv
add_to_path $HOME/.anyenv/bin

## pip
add_to_path $HOME/Library/Python/2.7/bin

### imagemagic
add_to_path $BREW_PATH/opt/imagemagick@6/bin

### openssl
add_to_path $BREW_PATH/opt/openssl@3/bin

### MySQL5.7
add_to_path $BREW_PATH/opt/mysql@5.7/bin

### TiUP
add_to_path $HOME/.tiup/bin

## for bundle install mysql
## @see https://github.com/brianmario/mysql2/pull/1051
export LIBRARY_PATH=:$OPENSSL_PATH/lib
export LDFLAGS="-L$OPENSSL_PATH/lib"
export CPPFLAGS="-I$OPENSSL_PATH/include"
export LD_LIBRARY_PATH="$OPENSSL_PATH/lib"

## java 11
export JAVA_HOME=$(/usr/libexec/java_home -v 11)

## android
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_TOOL_PATH=$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools
add_to_path $ANDROID_TOOL_PATH

## for ruby fork2
OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

## anyenv
if which anyenv > /dev/null; then eval "$(anyenv init -)"; fi

## goenv
if which goenv > /dev/null; then eval "$(goenv init -)"; fi
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.anyenv/envs/goenv/bin"

export GOENV_GOMOD_VERSION_ENABLE=1


## The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi

## The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi

## for react-native
export REACT_EDITOR=code

## for ruby depreated warnings
export RUBYOPT='-W:deprecated'

## Cargo
. "$HOME/.cargo/env"

## for secret enviromental variables
test -r ~/.zsh_private && . ~/.zsh_private