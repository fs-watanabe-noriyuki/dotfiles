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
    circleci
    cmake
    curl
    ffmpeg
    fzf
    git
    gh
    gradle
    imagemagick@6
    jq
    k6
    libiodbc
    maven
    mysql@5.7
    nginx
    openssl
    postgresql
    protobuf
    pstree
    pwgen
    reattach-to-user-namespace
    redis
    rustup-init
    shared-mime-info
    sl
    source-highlight
    tig
    tmux
    translate-shell
    tree
    unixodbc
    wget
    yarn
    zplug
    'openresty/brew/openresty'
    'vim --with-override-system-vi'
)

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
    alfred
    docker
    google-cloud-sdk
    hammerspoon
    iterm2
    java
    karabiner-elements
    phantomjs
    sequel-ace
    slack
    snowflake-snowsql
    visual-code-studio
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
