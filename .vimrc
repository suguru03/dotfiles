set autoindent

"バックアップファイルのディレクトリを指定する
set backupdir=$HOME/vimbackup

"クリップボードをWindowsと連携する
set clipboard=unnamed

"vi互換をオフする
set nocompatible

"スワップファイル用のディレクトリを指定する
set directory=$HOME/vimbackup

"タブの代わりに空白文字を指定する
set expandtab

"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden

"インクリメンタルサーチを行う
set incsearch

"行番号を表示する
set number

"閉括弧が入力された時、対応する括弧を強調する
set showmatch

"新しい行を作った時に高度な自動インデントを行う
set smarttab

" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

"" colorscheme
"syntax enebale
set background=dark
" colorscheme desert

set list
set listchars=tab:>\ ,trail:_,nbsp:%,extends:>,precedes:<
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
set expandtab
set autoindent
set cursorline
set backspace=indent,eol,start
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline

" pathogen
execute pathogen#infect()

" enable 256 colors in GNOME terminal (for my Ubuntu VM)
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
    endif

" turn on language specific syntax highlighting
syntax on

" jshint
let g:syntastic_check_on_open=0 "ファイルを開いたときはチェックしない
let g:syntastic_check_on_save=1 "保存時にはチェック
let g:syntastic_auto_loc_list=1 "エラーがあったら自動でロケーションリストを開く
let g:syntastic_loc_list_height=6 "エラー表示ウィンドウの高さ
set statusline+=%#warningmsg# "エラーメッセージの書式
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_javascript_checker = ['jshint'] "jshintを使う
let g:syntastic_mode_map = {
      \ 'mode': 'active',
            \ 'active_filetypes': ['ruby', 'javascript','json'],
                  \ 'passive_filetypes': []
                        \ }
"エラー表示マークを変更
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" neobundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif

  call neobundle#rc(expand('~/.vim/bundle/'))

  " Let NeoBundle manage NeoBundle
  NeoBundleFetch 'Shougo/neobundle.vim'

  " add plugins

  filetype plugin on

  NeoBundleCheck

NeoBundle 'editorconfig-vim'
NeoBundle 'scrooloose/nerdtree'

" タブをスペースにする
autocmd BufWritePre * :%s/\t/  /ge

" 保存時にスペース削除
autocmd BufWritePre * :%s/\s\+$//ge
