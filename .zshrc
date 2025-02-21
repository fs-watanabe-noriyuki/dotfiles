# load environment variables
source $HOME/.zsh_envs

# load alias
source $HOME/.zsh_aliases

# zplug settings
export ZPLUG_HOME=$BREW_PATH/opt/zplug
source $BREW_PATH/opt/zplug/init.zsh

# zplugの冗長なメッセージを抑制
export ZPLUG_LOG_LOAD_SUCCESS=false
export ZPLUG_LOG_LOAD_FAILURE=true

## plugins
zplug "mafredri/zsh-async", from:github, defer:0
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme, defer:1
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "b4b4r07/enhancd", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:3

## Install plugins if there are plugins that have not been installed
if ! zplug check > /dev/null; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

## Then, source plugins and add commands to $PATH
zplug load > /dev/null

## for rake commaned
setopt nonomatch


# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

# pnpm
export PNPM_HOME="/Users/noriyuki.watanabe/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Added by Windsurf
export PATH="/Users/noriyuki.watanabe/.codeium/windsurf/bin:$PATH"

# vscode shell integration
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
