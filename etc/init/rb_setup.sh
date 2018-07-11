#!/bin/bash

# utilに切り出したい
has() {
  type "$1" > /dev/null 2>&1
}

echo 'setup ruby with rbenv'

if has "rbenv"; then
  ## 最新のRubyを入れる
  #latest=`rbenv install --list | grep -v - | tail -n 1`
  target="2.3.1"
  current=`rbenv versions | grep '*' | cut -d' ' -f 2`
  if [ "$current" != "$target" ]; then
    echo "install $target"
    rbenv install $target
    echo "set ruby global $target"
    rbenv global $target
    rbenv init
    eval "$(rbenv init -)"
  fi
fi

# install bundler
if [[ -z `gem list | grep bundler` ]]; then
  echo 'install bundler'
  gem install bundler
fi

cat << END

**************************************************
Ruby $target Setuped! bye.
**************************************************

END
