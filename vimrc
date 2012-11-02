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
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-guicolorscheme'
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'taku-o/vim-ro-when-swapfound'
NeoBundle 'taku-o/vim-toggle'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'ujihisa/rdoc.vim'
NeoBundle 'ujihisa/neco-look'
NeoBundle "Lokaltog/vim-easymotion"
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'cucumber/cucumber'
NeoBundle 'tomasr/molokai'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'mattn/calendar-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'briancollins/vim-jst'
NeoBundle 'bbommarito/vim-slim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'Sixeight/unite-grep'
NeoBundle "adie/BlockDiff"
"Bundle 'myusuf3/numbers.vim'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'teramako/jscomplete-vim'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'tangledhelix/vim-octopress'
NeoBundle 'xhr/vim-io'

NeoBundle 'mattn/zencoding-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'taichouchou2/vim-javascript' " jQuery syntax追加

NeoBundle 'smartchr'
NeoBundle 'open-browser.vim'

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
set showcmd
let mapleader=","
" set gfn=ゆたぽん（コーディング）\ 10
set gfn=ゆたぽん（コーディング）:h12
"set gfn=ゆたぽん（コーディング）Bold:h13
"set gfn=ゆたぽん（COD）K:h13
"set gfn=Ricty-Bold:h13
"set gfn=RictyDiscord-Bold:h13
" 行番号
"set number
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
"set cursorline
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

" COLOR
"colorscheme molokai
"let g:molokai_original=1
"syntax enable
"set background=dark
"colorscheme solarized

"colorscheme Tomorrow-Night
colorscheme Tomorrow-Night-Eighties

" % def ~ end
runtime macros/matchit.vim

" indent guide enable
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=1

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
autocmd BufWritePre * call <SID>remove_dust()

" 保存時にRuby1.8 Hashを除去する
" origin by http://robots.thoughtbot.com/post/17450269990/convert-ruby-1-8-to-1-9-hash-syntax
autocmd BufWritePre * %s/\([^:]\+\):\{1}\([^ :"']\+\)\s=>/\1\2:/ge

set antialias                " アンチエイリアシング

" 挿入モード時、ステータスラインの色を変える
"autocmd InsertEnter * highlight StatusLine ctermfg=red
"autocmd InsertLeave * highlight StatusLine ctermfg=white

"タブ文字、行末など不可視文字を表示する
"set list
"listで表示される文字のフォーマットを指定する
"set listchars=eol$,tab:>\ ,extends:<

" 挿入モード時、ステータスラインのカラーを変更
"augroup InsertHook
"autocmd!
"autocmd InsertEnter * highlight StatusLine guifg=#080808 guibg=#859900
"autocmd InsertLeave * highlight StatusLine guifg=#808080 guibg=#080808
"augroup END

"function! GetB()
  "let c = matchstr(getline('.'),  '.',  col('.') - 1)
  "let c = iconv(c,  &enc,  &fenc)
  "return String2Hex(c)
"endfunction

""help eval-examples
"" The function Nr2Hex() returns the Hex string of a number.
"func! Nr2Hex(nr)
  "let n = a:nr
  "let r = ""
  "while n
    "let r = '0123456789ABCDEF'[n % 16] . r
    "let n = n / 16
  "endwhile
  "return r
"endfunc

"" The function String2Hex() converts each character in a string to a two
"" character Hex string.
"func! String2Hex(str)
  "let out = ''
  "let ix = 0
  "while ix < strlen(a:str)
    "let out = out . Nr2Hex(char2nr(a:str[ix]))
    "let ix = ix + 1
  "endwhile
  "return out
"endfunc

" 検索語を中央に表示する
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" }}}
" Unite" {{{

  " The prefix key.
  nnoremap    [unite]   <Nop>
  nmap    f [unite]

  nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
  nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
  nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
  nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
  nnoremap  [unite]f  :<C-u>Unite source<CR>

  autocmd FileType unite call s:unite_my_settings()
  function! s:unite_my_settings()"{{{
    " Overwrite settings.

    nmap <buffer> <ESC>      <Plug>(unite_exit)
    imap <buffer> jj      <Plug>(unite_insert_leave)
    "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

    " <C-l>: manual neocomplcache completion.
    inoremap <buffer> <C-l>  <C-x><C-u><C-p><Down>

    " Start insert.
    let g:unite_enable_start_insert = 1
  endfunction"}}}

  let g:unite_source_file_mru_limit = 200
  let g:unite_cursor_line_highlight = 'TabLineSel'
  let g:unite_abbr_highlight = 'TabLine'

  " For optimize.
  let g:unite_source_file_mru_filename_format = ''

  " For unite-session.
  " Save session automatically.
  "let g:unite_source_session_enable_auto_save = 1
  " Load session automatically.
  "autocmd VimEnter * UniteSessionLoad

  " For ack.
  if executable('ack-grep')
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
    let g:unite_source_grep_recursive_opt = ''
  endif

  """ unite.vim
  " バッファ一覧
  nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
  " ファイル一覧
  nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
  " レジスタ一覧
  nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
  " 最近使用したファイル一覧
  nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
  " 常用セット
  nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
  " 全部乗せ
  nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

  " ウィンドウを分割して開く
  au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  " ウィンドウを縦に分割して開く
  au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  " ESCキーを2回押すと終了する
  au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
  au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" }}}
" Neocomplcache" {{{

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

  " Plugin key-mappings.
  imap <C-k>     <Plug>(neocomplcache_snippets_expand)
  smap <C-k>     <Plug>(neocomplcache_snippets_expand)

  let g:neocomplcache_snippets_dir='~/.vim/snippets'

  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif

  inoremap <expr><C-x><C-o> &filetype == 'vim' ? "\<C-x><C-v><C-p>" : neocomplcache#manual_omni_complete()

" " }}}
" Other " {{{

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

" " }}}
