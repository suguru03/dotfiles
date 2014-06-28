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

" colorscheme
syntax enable
set background=dark
 colorscheme desert
" color schema
" colorscheme railscasts

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
if !has('gui_running')
  set t_Co=256
  syntax enable
  set background=dark
  colorscheme base16-railscasts
endif

" turn on language specific syntax highlighting
" syntax on

set clipboard=unnamed,autoselect " use os clipboard (only gui)

" jshint
let g:syntastic_check_on_open=0 "ファイルを開いたときはチェックしない
let g:syntastic_check_on_save=1 "保存時にはチェック
let g:syntastic_auto_loc_list=1 "エラーがあったら自動でロケーションリストを開く
let g:syntastic_loc_list_height=4 "エラー表示ウィンドウの高さ
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


" タブをスペースにする
autocmd BufWritePre * :%s/\t/  /ge

" 保存時にスペース削除
autocmd BufWritePre * :%s/\s\+$//ge

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
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'scrooloose/syntastic'

"" complcache
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'jnurmine/Zenburn'
NeoBundle '29decibel/codeschool-vim-theme'
NeoBundle 'tomasr/molokai'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'vim-scripts/AutoClose'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'sgur/unite-qf'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'tpope/vim-surround'
" NeoBundle "kien/ctrlp.vim"
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'LeafCage/yankround.vim'

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \  'mac' : 'make -f make_mac.mak',
  \  'unix' : 'make -f make_unix.mak',
  \  },
  \ }

" yankround
let g:yankround_max_history = 30

" multi coursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" NeoComplCache
let g:neocomplcache_enable_at_startup = 1 " Use neocomplcache.
let g:neocomplcache_enable_smart_case = 1 " Use smartcase.
let g:neocomplcache_enable_camel_case_completion = 1 " Use camel case completion.
let g:neocomplcache_enable_underbar_completion = 1 " Use underbar completion.
set completeopt=menuone " 補完ウィンドウの設定

" tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"

" NeoSnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" NERDTree
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=0
let g:NERDTreeMouseMode=2
let g:NERDTreeShowBookmarks = 1

" moving each window like eamcs.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
