filetype off

" gocode
set rtp+=$GOROOT/misc/vim

"---------------------------"
" plugin
"---------------------------"

" 設定開始
call plug#begin('~/.vim/plugged')

"### Language ###
Plug 'ingtk/nerdtree', { 'on': ['NERDTreeToggle'] }

if has('nvim')
  Plug 'benekastah/neomake'
else
  Plug 'vim-syntastic/syntastic'
endif
" for go
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'vim-jp/vim-go-extra', { 'for': 'go' }
Plug 'buoto/gotests-vim', { 'for': 'go', 'do': 'go get -u github.com/cweill/gotests' }
" for js, json
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'elzr/vim-json'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
" for rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
" for scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
" for writing configuration
Plug 'ekalinin/dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'evanmiller/nginx-vim-syntax', { 'for': 'nginx' }
" for Protocol Buffers
Plug 'uarun/vim-protobuf', { 'for': 'protobuf' }
" for haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
" for ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

"### Completion ###
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'prettier/vim-prettier'

"### Code Display ###
"Plug 'Yggdroot/indentLine'
Plug 'easysid/mod8.vim'
Plug 'joshdick/onedark.vim'

"### Integrations ###
Plug 'rking/ag.vim'
Plug 'rhysd/clever-f.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tyru/open-browser.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'nfvs/vim-perforce'

"### Interface ###
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 't9md/vim-choosewin'
Plug 'Shougo/unite.vim'
Plug 'wincent/command-t', { 'do': 'cd ruby/command-t && ruby extconf.rb && make' }

"### Commands ###
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'LeafCage/yankround.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'thinca/vim-quickrun'
Plug 'LeafCage/yankround.vim'

"### Other ###
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'yuroyoro/smooth_scroll.vim'
"Plug 'xolox/vim-easytags'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/sudo.vim'
Plug 'kannokanno/previm'
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

call plug#end()

"---------------------------"
" color
"---------------------------"

if !has('gui_running') || has('nvim')
  if (has("termguicolors"))
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
   endif

  " set t_Co=256
  syntax enable
  set background=dark
  "colorscheme onedark
  colorscheme mod8
endif

"---------------------------
" basic
"---------------------------

set autoread " automaticaly reload file who chaged outside
set nobackup " not create backup file
set noswapfile " not create swap file
set noundofile
set showcmd
set showmode
set modeline
set showtabline=2 " 常にタブを表示
"setlocal formatoptions-=r
"setlocal formatoptions-=o
set autochdir
set ic

set backspace=indent,eol,start

if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

if has('nvim')
  set clipboard+=unnamedplus
  function! ClipboardYank()
    call system('pbcopy', @@)
  endfunction
  function! ClipboardPaste()
    let @@ = system('pbpaste')
  endfunction

  vnoremap <silent> y y:call ClipboardYank()<cr>
  vnoremap <silent> d d:call ClipboardYank()<cr>
  nnoremap <silent> p :call ClipboardPaste()<cr>
  onoremap <silent> y y:call ClipboardYank()<cr>
  onoremap <silent> d d:call ClipboardYank()<cr>

  " let g:python3_host_prog = expand('$HOME') . '/.anyenv/envs/pyenv/shims/python3'
else
  set clipboard=unnamed,autoselect " use os clipboard
endif

let mapleader = "\<Space>"
"let mapleader = ","
nnoremap <silent> <Leader>t :<C-u>tabedit<CR>

"---------------------------
" appearance
"---------------------------

set showmatch
set number " line number
"ssofttabstopet linespace=4
set conceallevel=0
let g:vim_json_syntax_conceal=0
set hlsearch

" コマンド実行中は再描画しない
set lazyredraw
" 高速ターミナル接続を行う
set ttyfast

" ESC 2回でハイライトを解除
nnoremap <ESC><ESC> :nohlsearch<CR>

set list
set listchars=tab:>\ ,trail:_,nbsp:%,extends:>,precedes:<

"---------------------------
" indent
"---------------------------

set autoindent
set smartindent
set tabstop=4 " tabstop
set softtabstop=2
set shiftwidth=2 " タブを挿入するときの幅
set expandtab

"" 基本editorconfigに寄せる（vscodeとの互換のため）
if has("autocmd")
"
"  au FileType html set ts=2 sw=2 expandtab
"  au FileType php set ts=4 sw=4 noexpandtab
"  au FileType python set ts=4 sw=4 expandtab
"  au FileType ruby set ts=2 sw=2 expandtab
"  au FileType slim set ts=2 sw=2 expandtab
"  au FileType coffee set ts=2 sw=2 expandtab
  au FileType java set ts=2 sw=2 expandtab
  au FileType javascript set ts=2 sw=2 expandtab
  au FileType typescript set ts=4 sw=4 expandtab
"  au FileType yaml set ts=2 sw=2 expandtab
  au FileType go set ts=2 sw=2 noexpandtab
"  au FileType terraform set ts=2 sw=2 expandtab
"  au FileType swift set ts=4 sw=4 expandtab
"  au FileType crystal set ts=2 sw=2 expandtab
"  au FileType make set ts=4 sw=4 noexpandtab
"
"  au BufRead,BufNewFile *.scala setf scala
"  au BufRead,BufNewFile *.go setf go
"  au BufRead,BufNewFile,BufEnter *.rs setf rust
"
endif

" vim-javascript
"let g:javascript_plugin_jsdoc = 1
"set foldmethod=syntax

"---------------------------
" editing
"---------------------------

set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

"augroup auto_comment_off
"autocmd!
"  autocmd BufEnter * setlocal formatoptions-=r
"  autocmd BufEnter * setlocal formatoptions-=o
"augroup END

" jq for vim
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
  if 0 == a:0
    let l:arg = "."
  else
    let l:arg = a:1
  endif
  execute "%! jq \"" . l:arg . "\""
endfunction

command! -nargs=? Trim call s:Trim()
function! s:Trim()
  let cursor = getpos(".")
  %s/\s\+$//ge
  %s/　\+$//ge
  call setpos(".", cursor)
  unlet cursor
endfunction
"autocmd BufWritePre * call <SID>Trim()

nnoremap <silent> <Leader>r :<C-u>e!<CR>

vnoremap v ^$h

vnoremap < <gv
vnoremap > >gv

"---------------------------
" move
"---------------------------
if !has('gui_running')
  nnoremap <Tab> gt
  nnoremap <S-Tab> gT
endif

nnoremap <Right> <Nop>
nnoremap <Left> <Nop>

" prohibit arrow keys
inoremap <Right> <Nop>
"inoremap <Left> <Nop> " 日本語入力時に誤動作するためコメント
inoremap <Up> <Nop>
inoremap <Down> <Nop>
nnoremap <Right> <Nop>
nnoremap <Left> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap 0 :<C-u>call append(expand('.'), '')<Cr>

if has('nvim')
  nmap <BS> <C-W>h
endif

" moving each window like eamcs.
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

nnoremap <C-w>e <C-w>x
nnoremap <C-w><C-e> <C-w>x

" easymotion
let g:EasyMotion_do_mapping = 0

nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

nmap g/ <Plug>(easymotion-sn)
xmap g/ <Plug>(easymotion-sn)
omap g/ <Plug>(easymotion-tn)

set scrolloff=10

"---------------------------
" completion
"---------------------------

"++++++++++++++++++++++++++++++++++++++++++++++++++
" NeoComplete
"if has('nvim')
"  " Use deoplete
"  let g:deoplete#enable_at_startup = 1
"  let g:deoplete#enable_smart_case = 1
"  let g:deoplete#enable_ignore_case = 1
"  let g:deoplete#auto_completion_start_length=2
"  let g:deoplete#sources#syntax#min_keyword_length = 1
"  let g:deoplete#enable_fuzzy_completion = 1
"  let g:deoplete#ignore_sources = {}
"
"  "inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"  "inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
"  "inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
"  "inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
"  "inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"  "function! s:my_cr_function() abort
"  "  return deoplete#mappings#close_popup()
"  "endfunction
"  "inoremap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>"
"
"
"  let g:deoplete#sources#go#align_class = 1
"  let g:deoplete#sources#go#gocode_binary = expand('$GOPATH') . '/bin/gocode'
"else
  "let g:acp_enableAtStartup = 0
  "let g:neocomplete#enable_at_startup = 1
  "let g:neocomplete#enable_smart_case = 1
  "let g:neocomplete#enable_camel_case = 1
  "if !exists('g:neocomplete#keyword_patterns')
  "  let g:neocomplete#keyword_patterns = {}
  "endif
  "let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  "" tabで補完候補の選択を行う
  "inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  "inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
  "inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "\<CR>"

  " Trigger configuration. Do not use <tab> if you use
  " https://github.com/Valloric/YouCompleteMe.

  let g:ycm_key_list_select_completion = ['<TAB>']
  let g:ycm_key_list_previous_completion = ['<S-TAB>']
  let g:ycm_confirm_extra_conf = 0
  inoremap <expr> <Enter> pumvisible() ? "<Esc>a" : "<Enter>"

"endif

let g:UltiSnipsExpandTrigger="<C-k>"
let g:UltiSnipsJumpForwardTrigger="<C-k>"
let g:UltiSnipsJumpBackwardTrigger="<C-j>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" pretter
let g:prettier#autoformat = 0
" I need a good macbook...
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync
let g:prettier#config#bracket_spacing = 1

""++++++++++++++++++++++++++++++++++++++++++++++++++


""++++++++++++++++++++++++++++++++++++++++++++++++++
"" NeoSnippet
"imap <C-k> <Plug>(neosnippet_expand_or_jump)
"smap <C-k> <Plug>(neosnippet_expand_or_jump)
"xmap <C-k> <Plug>(neosnippet_expand_target)
"
"
""let g:neosnippet#disable_runtime_snippets = {
""  \ '_' : 1,
""  \ }
"
"" for golang
"let g:go_snippet_engine = "neosnippet"
"
""For snippet_complete marker.
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif
""++++++++++++++++++++++++++++++++++++++++++++++++++

"---------------------------
" plugin
"---------------------------

"let g:polyglot_disabled = ['json']

if has('nvim')
  " neomake
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_go_enabled_makers = ['go', 'govet']
  autocmd! BufWritePost * Neomake
else
  " syntastic
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_check_on_open=0 "ファイルを開いたときはチェックしない
  let g:syntastic_check_on_save=1 "保存時にはチェック
  let g:syntastic_auto_loc_list=1 "エラーがあったら自動でロケーションリストを開く
  let g:syntastic_loc_list_height=4 "エラー表示ウィンドウの高さ
  set statusline+=%#warningmsg# "エラーメッセージの書式
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  "let g:syntastic_javascript_checkers = ['jshint', 'eslint']
  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_typescript_checkers = ['tslint']
  let g:syntastic_mode_map = {
    \ 'mode': 'active',
    \ 'active_filetypes': ['javascript', 'typescript', 'go'],
    \ 'passive_filetypes': ['html', 'python'] }
  let g:syntastic_python_checkers = ['pylint']
  let g:syntastic_go_checkers = ['go', 'govet', 'gofmt', 'golint']
  let g:syntastic_aggregate_errors = 1

  "エラー表示マークを変更
  let g:syntastic_enable_signs=1
  let g:syntastic_error_symbol='✗'
  let g:syntastic_warning_symbol='⚠'
endif

" colon, semicolon
noremap ; :
" it will break nerd tree
" noremap : ;
inoremap ; :
inoremap : ;

" escape insert mode
inoremap jj <ESC>

" remove space when file is saved
autocmd BufWritePre * :%s/\s\+$//ge
autocmd BufWritePre * :%s/　\+$//ge

" NERD Commenter
let NERDSpaceDelims = 1
let g:NERDTreeShowBookmarks = 1
nmap <C-C> <Plug>NERDCommenterToggle
vmap <C-C> <Plug>NERDCommenterToggle

" NERD Tree
map <silent> <C-e> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Tagbar
" ctags --languages=Ruby -f ~/ruby.tags <PWD>
nnoremap <silent> ,t :TagbarToggle<CR>
nnoremap <silent>  <C-y> <C-t><CR>
nnoremap <silent> <C-t> <C-]><CR>
au BufNewFile,BufRead *.rb set tags+=$HOME/ruby.tags

" Tsuquyomi
let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_disable_quickfix = 1
autocmd FileType typescript map <silent> <C-t> <Plug>(TsuquyomiDefinition)
autocmd FileType typescript map <silent> <C-y> <Plug>(TsuquyomiGoBack)

" choosewin
nmap  -  <Plug>(choosewin)
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
let g:choosewin_overlay_clear_multibyte = 1

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

" smooth_scroll.vim
map :call SmoothScroll("d",1, 1)<CR>
map :call SmoothScroll("u",1, 1)<CR>

" unite
nnoremap <silent> <Leader>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <Leader>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <Leader>ut :<C-u>Unite tab<CR>
nnoremap <silent> <Leader>uy :<C-u>Unite yankround<CR>

" Vim AirLine
let g:airline_theme = 'bubblegum'

" Clever-f
let g:clever_f_fix_key_direction = 1
let g:clever_f_smart_case = 1

" Don't use preview at QuickFix
let QFix_PreviewEnable = 0

" Command-T
nmap <silent> <Leader>p <Plug>(CommandT)
let g:CommandTMaxFiles=200000
let g:CommandTMaxDepth=15
let g:CommandTScanDotDirectories=0
let g:CommandTWildIgnore=&wildignore . ',*/DS_Store,*/.git,*/.hg,*/.svn,*/node_modules,*/bower_components,*/vendor'

" yankround
let g:yankround_max_history = 30

nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

" indentLine
"set list lcs=tab:\¦\
" let g:indentLine_conceallevel = 0

"" python3 support for nvim
"let g:python3_host_prog = expand('$HOME') . '/.anyenv/envs/pyenv/shims/python3'

" vim-markdown
"let g:vim_markdown_folding_disabled=1

" previm
let g:previm_open_cmd="open -a Google\\ Chrome"

"---------------------------
" programming
"---------------------------

"" coffeescript
"autocmd BufWritePost *.coffee silent make!

" swif
"
" javascript
inoremap <C-c> console.log('ｷﾀ ━━━ヽ(´ω`)ﾉ ━━━!!');
inoremap <C-\> console.log(require('util').inspect(result, false, null));

" unite
nnoremap <silent> <Leader>gd :<C-u>GoDef<CR>

" go
let g:go_fmt_autosave = 1
let g:go_fmt_command = "gofmt"
"let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"nnoremap <silent> <Leader>gi :<C-u>GoImports<CR>
"nnoremap <silent> <Leader>gf :<C-u>GoFmt<CR>

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_command = expand('$HOME') . '/.cargo/bin/rustfmt'

set hidden
let g:racer_cmd = expand('$HOME') . '/.cargo/bin/racer'
let $RUST_SRC_PATH = expand('$HOME') . '/rust-src/rustc-1.12.0/src'

filetype plugin indent on
