"Vim Bundles "  {{{
set rtp+=~/.vim/vundle.git/ 
call vundle#rc()

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
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-endwise'
Bundle 'Shougo/neocomplcache'

" vim-scripts repos
Bundle 'molokai'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!
" }}}
"BASIC " {{{ 
set gfn=ゆたぽん（コーディング）\ 10
" 行番号
set number 
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

set splitright 
set splitbelow 
set visualbell

set nocompatible               " be iMproved
filetype off                   " required!
syntax enable

"helpの言語の優先順位
set helplang=ja,en

" window size 
" please push Alt+F10

" COLOR
colorscheme molokai
let g:molokai_original=1

set helplang=ja,en
" }}}
" Other " {{{
" rails.vim {
let g:rails_level=4
let g:rails_default_file="app/controllers/application_controller.rb"
"}

" neocomplcache {
" Disable AutoComplPop.
let g:acp_enableAtStartup=0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup=1
" Use smartcase.
let g:neocomplcache_enable_smart_case=1
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion=1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion=1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length=3
let g:neocomplcache_lock_buffer_name_pattern='\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists={
\ 'default' : '',
\ 'vimshell' : $HOME.'/.vimshell_hist',
\ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
let g:neocomplcache_keyword_patterns={}
endif
let g:neocomplcache_keyword_patterns['default']='\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup()."\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

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
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" }
"
" " }}}
