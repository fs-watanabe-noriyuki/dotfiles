#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade

formulas=(
    antidote
    anyenv
    autoconf
    awscli
    bison
    boost
    cairo
    cmake
    curl
    ffmpeg
    fzf
    giflib
    git
    gh
    gradle
    imagemagick@6
    java11
    jpeg
    jq
    k6
    libffi
    libiodbc
    libpng
    librsvg
    libtool
    libxslt
    libyaml
    maven
    nginx
    openssl
    pango
    pkg-config
    postgresql
    protobuf
    pstree
    pwgen
    readline
    reattach-to-user-namespace
    redis
    rustup-init
    shared-mime-info
    shfmt
    sl
    source-highlight
    tig
    tmux
    translate-shell
    tree
    unixodbc
    uv
    wget
    yarn
    zlib
    'openresty/brew/openresty'
    vim
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
    visual-studio-code
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
