"Vim Bundles "  {{{
"How to set up .
"git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
set nocompatible               " be iMproved
filetype off                   " required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundle 'Shougo/neobundle.vim'

"
" Original Bundle
"
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
"Bundle 'gmarik/vundle'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-liquid'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-guicolorscheme'
"NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'taku-o/vim-ro-when-swapfound'
NeoBundle 'taku-o/vim-toggle'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'ujihisa/rdoc.vim'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'taichouchou2/vim-javascript' " jQuery syntax追加
NeoBundle "Lokaltog/vim-easymotion"
NeoBundle 'bling/vim-airline'
NeoBundle 'mattn/calendar-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle "gmarik/sudo-gui.vim"
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'briancollins/vim-jst'
NeoBundle 'groenewege/vim-less'
NeoBundle 'Sixeight/unite-grep'
NeoBundle "adie/BlockDiff"
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'teramako/jscomplete-vim'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle "vim-scripts/zoom.vim"
NeoBundle "vim-scripts/sudo.vim"
NeoBundle 'tangledhelix/vim-octopress'
NeoBundle 'xhr/vim-io'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle "honza/vim-snippets"
NeoBundle "fuenor/im_control.vim"
NeoBundle "basyura/unite-rails"
NeoBundle 'rking/ag.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'nono/vim-handlebars'
NeoBundle 'heartsentwined/vim-emblem'

" http://qiita.com/items/839f4b9e07cf7f341835
"NeoBundle "rhysd/unite-ruby-require.vim"
NeoBundle "rhysd/neco-ruby-keyword-args"
NeoBundle "kana/vim-textobj-user"
NeoBundle "rhysd/vim-textobj-ruby"
NeoBundle "nanotech/jellybeans.vim"
NeoBundle "slim-template/vim-slim"

NeoBundle 'smartchr'
NeoBundle 'open-browser.vim'
NeoBundle 'Wombat'


" vim-scripts repos
" Bundle 'molokai'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!

if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

" }}}
"BASIC " {{{
"
" font
set gfn=ゆたぽん（コーディング）:h12
"set gfn=Ricty-Bold:h13
"set gfn=RictyDiscord-Bold:h13

set showcmd
let mapleader=","
" 行番号
set number
" 現在の行をハイライト
set cursorline
set foldmethod=marker
" インクリメンタルサーチ
set incsearch
" 検索結果のハイライト
set hlsearch
" インデント
set cindent
" タブの設定
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set showmatch
set nobackup
set splitright
set splitbelow
set visualbell
set magic
set wrap
set wildmenu
set smartindent
set ignorecase smartcase

" 検索を循環させない
set nowrapscan

" 文字コード関連
" 文字コードの自動解釈の優先順位
set fileencodings=utf-8,cp932,euc-jp
" 改行コードの解釈優先順位
set fileformats=unix,dos

" 内部の解釈の文字コード　設定ファイルもこのコードで書け
set encoding=utf-8
" 内部の改行コード
set fileformat=unix

syntax enable

" helpの言語の優先順位
set helplang=ja,en

" window size
" please push Alt+F10


" % def ~ end
runtime macros/matchit.vim

" indent guide enable
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 1
let g:indent_guides_color_change_percent = 5
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=4

" ESC + ESC = no hi
nnoremap <Esc><Esc> :nohlsearch<CR>

"inoremap <expr> = smartchr#loop(' = ', '=', ' == ')
"autocmd FileType ruby inoremap <expr> = smartchr#loop(' = ', ' => ', '=', ' == ')
"autocmd FileType eruby inoremap <expr> = smartchr#loop('<%= ', ' = ', '=', ' == ')
"autocmd FileType haml inoremap <expr> = smartchr#loop('= ', ' => ', '=', ' == ')
inoremap <expr> , smartchr#one_of(', ', ',')

imap <C-j> <C-[>
nmap <C-j> <C-[>

imap jj <C-[>

function! s:remove_dust()
    let cursor = getpos(".")
    " 保存時に行末の空白を除去する
    %s/\s\+$//ge
    " " 保存時にtabを2スペースに変換する
    %s/\t/  /ge
    call setpos(".", cursor)
    unlet cursor
endfunction
"autocmd BufWritePre * call <SID>remove_dust()

" Ruby1.8 Hashを除去する
" origin by http://robots.thoughtbot.com/post/17450269990/convert-ruby-1-8-to-1-9-hash-syntax
"autocmd BufWritePre * %s/\([^:]\+\):\{1}\([^ :"']\+\)\s=>/\1\2:/ge

" アンチエイリアシング
set antialias

" 検索語を中央に表示する
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

noremap <Leader>t :noautocmd vimgrep /TODO/j **/*.rb **/*.js **/*.coffee **/*.css **/*.sass **/*.spec **/*.erb **/*.haml<CR>:cw<CR>

" http://qiita.com/items/bd97a9b963dae40b63f5
vnoremap <silent> <C-p> "0p<CR>

au BufRead,BufNewFile *.hamlc set ft=haml

" }}}
"COLOR" {{{
"colorscheme molokai
"let g:molokai_original=1

syntax enable
"set background=dark
"colorscheme solarized

"colorscheme Tomorrow-Night
"colorscheme Tomorrow-Night-Eighties
"colorscheme wombat
"colorscheme jellybeans
let g:hybrid_use_Xresources = 1
colorscheme hybrid
" }}}
" Unite" {{{

  let g:unite_enable_start_insert=1
  let g:unite_source_history_yank_enable =1
  let g:unite_source_file_mru_limit = 200

  """" unite.vim
  "" ヤンク一覧
  nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
  "" バッファ一覧
  nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
  "" ファイル一覧
  nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
  "" レジスタ一覧
  nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
  "" 最近使用したファイル一覧
  "nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
  "" 常用セット
  nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
  "" 全部乗せ
  "nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

  nnoremap <silent> ,uc :<C-u>Unite colorscheme -auto-preview<CR>

" }}}
" Neocomplcache" {{{


  "===== new
  "TODO
  "===== old
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplcache.
  let g:neocomplcache_enable_at_startup = 1
  " Use smartcase.
  let g:neocomplcache_enable_smart_case = 1
  " Use camel case completion.
  "let g:neocomplcache_enable_camel_case_completion = 1
  " Use underbar completion.
  let g:neocomplcache_enable_underbar_completion = 1
  " Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

  let g:neocomplcache_auto_completion_start_length = 3

  " Define dictionary.
  let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
          \ }

  " Define keyword.
  if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <expr><CR>  neocomplcache#close_popup() . "\<CR>"
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplcache#close_popup()
  inoremap <expr><C-e>  neocomplcache#cancel_popup()

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType javascript setlocal omnifunc=jscomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " Enable heavy omni completion.
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  "let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*:'
  "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*:'
  let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
  let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*:'

  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  "let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*:'
  "
  inoremap <expr><C-x><C-o> &filetype == 'vim' ? "\<C-x><C-v><C-p>" : neocomplcache#manual_omni_complete()
" " }}}
" NeoSnippet" {{{

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
xmap <C-l>     <Plug>(neosnippet_start_unite_snippet_target)

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" " }}}
" Other " {{{

let g:rails_projections = {
	      \ "app/decorators/*_decorator.rb": {
	      \   "command": "decorator",
	      \   "test": [
	      \     "spec/decorators/%s_decorator_spec.rb"
	      \   ]
	      \ }}
" github
let g:github_user = 'takuyan'
"let g:github_token = ''

" <leader>
let mapleader=","

" vim-toggle
imap <C-C> <Plug>ToggleI
nmap <C-C> <Plug>ToggleN
vmap <C-C> <Plug>ToggleV

"nnoremap <Leader>sn :NumbersToggle<CR>

let g:Powerline_symbols = 'unicode'

" rhysd/unite-ruby-require.vim
" Usage
" :Unite ruby/require
" This is for rbenv user
let g:unite_source_ruby_require_ruby_command = '$HOME/.rbenv/shims/ruby'

" 日付挿入
imap <silent> <C-D><C-D> <C-R>=strftime("%Y-%m-%d")<CR>

" " }}}
