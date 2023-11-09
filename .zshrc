# load environment variables
source $HOME/.zsh_envs

# load alias
source $HOME/.zsh_aliases

# zplug settings
export ZPLUG_HOME=$BREW_PATH/opt/zplug
source $BREW_PATH/opt/zplug/init.zsh

## plugins
zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting"

zplug "b4b4r07/enhancd"

## Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

## Then, source plugins and add commands to $PATH
zplug load

## for rake commaned
setopt nonomatch

