# load environment variables
source $HOME/.zsh_envs

# load functions
source $HOME/.zsh_functions

# load alias
source $HOME/.zsh_aliases

# antidote
source $BREW_PATH/opt/antidote/share/antidote/antidote.zsh
autoload -Uz compinit
compinit -C
antidote load

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
