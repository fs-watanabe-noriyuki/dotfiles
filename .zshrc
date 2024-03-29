source ~/.bash_profile

# zplug settings
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# plugins
zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting"

zplug "b4b4r07/enhancd"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# for rake commaned
setopt nonomatch

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/noriyuki.watanabe/work/tool/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/noriyuki.watanabe/work/tool/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/noriyuki.watanabe/work/tool/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/noriyuki.watanabe/work/tool/google-cloud-sdk/completion.zsh.inc'; fi
