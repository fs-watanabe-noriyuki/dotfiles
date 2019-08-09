#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade

formulas=(
    git
    wget
    curl
    tree
    openssl
    peco
    tig
    mysql@5.7
    tmux
    reattach-to-user-namespace
    sl
    redis
    nginx
    pstree
    cmake
    awscli
    boost
    rbenv
    jq
    zsh
    zplug
    'vim --with-override-system-vi'
    go
    glide
    source-highlight
    'openresty/brew/openresty'
    pwgen
    postgresql
    ndenv
    yarn
    gradle
    translate-shell
    oath-toolkit
)

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
    evernote
    skitch
    slack
    alfred
    iterm2
    docker
    xmind
    java
    phantomjs
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew cask install $cask
done

brew cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
