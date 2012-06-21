"Vim Bundles "  {{{
"How to set up .
"git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"set cursorline
set wrap
set wildmenu
set smartindent
set ignorecase smartcase

" My Bundles here:
"
" original repos on github

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimproc'
Bundle 'thinca/vim-qfreplace'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-guicolorscheme'
Bundle 'taku-o/vim-ro-when-swapfound'
Bundle 'taku-o/vim-toggle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ujihisa/rdoc.vim'
Bundle 'ujihisa/neco-look'
Bundle 'ujihisa/neco-ruby'
Bundle "Lokaltog/vim-easymotion"
Bundle 'altercation/vim-colors-solarized'
Bundle 'cucumber/cucumber'
Bundle 'tomasr/molokai'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'mattn/calendar-vim'
Bundle 'mattn/gist-vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'briancollins/vim-jst'
Bundle 'bbommarito/vim-slim'
Bundle 'groenewege/vim-less'
Bundle 'Sixeight/unite-grep'
Bundle "adie/BlockDiff"

Bundle 'smartchr'

" vim-scripts repos
" Bundle 'molokai'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!
" }}}
"BASIC " {{{
let mapleader=","
" set gfn=ゆたぽん（コーディング）\ 10
set gfn=ゆたぽん（COD）K:h13
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

syntax enable

" helpの言語の優先順位
set helplang=ja,en

" window size
" please push Alt+F10

" COLOR
colorscheme molokai
let g:molokai_original=1
"syntax enable
"set background=dark
"colorscheme solarized

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

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" " 保存時にtabを2スペースに変換する
autocmd BufWritePre * :%s/\t/  /ge
" 保存時にRuby1.8 Hashを除去する
"autocmd BufWritePre * :%s/\s\.:\([^ ]*\)\(\s*\)=>/\1:/ge
autocmd BufWritePre * :%s/\s\+:\([^ ]*\)\(\s*\)=>/ \1:/ge

set antialias                " アンチエイリアシング

" 挿入モード時、ステータスラインの色を変える
"autocmd InsertEnter * highlight StatusLine ctermfg=red
"autocmd InsertLeave * highlight StatusLine ctermfg=white

"タブ文字、行末など不可視文字を表示する
"set list
"listで表示される文字のフォーマットを指定する
"set listchars=eol:$,tab:>\ ,extends:<

" 挿入モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#080808 guibg=#859900
autocmd InsertLeave * highlight StatusLine guifg=#808080 guibg=#080808
augroup END

function! GetB()
  let c = matchstr(getline('.'),  '.',  col('.') - 1)
  let c = iconv(c,  &enc,  &fenc)
  return String2Hex(c)
endfunction

"help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc

" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc

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
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " Enable heavy omni completion.
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  "let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
  let g:neocomplcache_omni_patterns.ruby = '\h\w*'
  "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
  let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  "let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

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

" " }}}
