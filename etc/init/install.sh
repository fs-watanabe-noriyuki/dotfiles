#!/bin/bash

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -snfv ~/dotfiles/"$f" ~/
done

source ~/.zshrc

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
