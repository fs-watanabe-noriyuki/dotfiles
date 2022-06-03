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
    anyenv
    awscli
    boost
    cmake
    curl
    ffmpeg
    fzf
    git
    gh
    go
    gradle
    imagemagick@6
    jq
    libiodbc
    maven
    mysql@5.7
    nginx
    openssl
    postgresql
    protobuf
    pstree
    pwgen
    rbenv
    reattach-to-user-namespace
    redis
    shared-mime-info
    sl
    source-highlight
    tig
    tmux
    translate-shell
    tree
    wget
    yarn
    'openresty/brew/openresty'
    'vim --with-override-system-vi'
)

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
    docker
    iterm2
    java
    snowflake-snowsql
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew install $cask --cask
done

brew cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
