#! /bin/sh
mkdir ~/vimbackup

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# YouCompleteMe
cd ~
mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core --config Release
cd ~/.vim/plugged/YouCompleteMe
./install.py --clang-completer --gocode-completer --tern-completer
