set nocompatible
filetype off

if has('vim_starting')
  " gocode
  set rtp+=$GOROOT/misc/vim
  " golint
  "exe "set rtp+=" . globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
  exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
  " neobundle
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

"--------------------
" plugin
"--------------------

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
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'mattn/sonictemplate-vim'
NeoBundle 'fatih/vim-go'

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \  'mac' : 'make -f make_mac.mak',
  \  'unix' : 'make -f make_unix.mak',
  \  },
  \ }

NeoBundleCheck
filetype plugin on

"--------------------
" basic
"--------------------

set directory=$HOME/vimbackup
set backupdir=$HOME/vimbackup
set clipboard=unnamed,autoselect " use os clipboard (only gui)
set backspace=indent,eol,start

"--------------------
" appearance
"--------------------

set number " line nember
set showmatch
set list
set listchars=tab:>\ ,trail:_,nbsp:%,extends:>,precedes:<
set cursorline

"--------------------
" indent
"--------------------

set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" タブをスペースにする
autocmd BufWritePre * :%s/\t/  /ge

" 保存時にスペース削除
autocmd BufWritePre * :%s/\s\+$//ge

if has("autocmd")
    au FileType html set ts=2 sw=2 sts=2 expandtab
    au FileType yaml set ts=2 sw=2 sts=2 expandtab
    au FileType coffee set ts=2 sw=2 sts=2 expandtab
    au FileType javascript set ts=2 sw=2 sts=2 expandtab

    au BufRead,BufNewFile *.ejs set filetype=jst ts=2 sw=2 sts=2 expandtab
    au BufRead,BufNewFile *.ejs.* set filetype=jst ts=2 sw=2 sts=2 expandtab
    au BufRead,BufNewFile Vagrantfile set filetype=ruby ts=2 sw=2 sts=2 expandtab
endif

"--------------------
" editing
"--------------------

set iminsert=0 imsearch=0
set noimdisable
set noimcmdline

" Jq for vim
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction

"--------------------
" grep
"--------------------

set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh


"--------------------
" colorscheme
"--------------------

" enable 256 colors in GNOME terminal (for my Ubuntu VM)
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

if !has('gui_running')
  set t_Co=256
  syntax enable
  set background=dark
  colorscheme base16-railscasts
  " colorscheme desert
  " colorscheme railscasts
end

"--------------------
" move
"--------------------

" moving each window like eamcs.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

"--------------------
" completion
"--------------------
"
set incsearch

" NeoComplCache
let g:neocomplcache_enable_at_startup = 1 " Use neocomplcache.
let g:neocomplcache_enable_smart_case = 1 " Use smartcase.
let g:neocomplcache_enable_camel_case_completion = 1 " Use camel case completion.
let g:neocomplcache_enable_underbar_completion = 1 " Use underbar completion.
set completeopt=menuone,menu,preview " 補完ウィンドウの設定

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

" for golang
" let g:go_snippet_engine = "neosnippet"

"--------------------
" plugin
"--------------------

" yankround
let g:yankround_max_history=30

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

" multi coursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

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
let g:NERDTreeShowBookmarks=1

" pathogen
execute pathogen#infect()

