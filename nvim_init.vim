"Dein"  {{{

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=$HOME/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')

  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-bundler')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-haml')
  call dein#add('tpope/vim-liquid')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-rake')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-surround')
  call dein#add('MaxMEllon/vim-jsx-pretty')

  " REQUIRED: Add a syntax file. YATS is the best
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install() " もし新しいプラグインがあれば起動時にインストールする
 call dein#install()
endif

filetype plugin indent on
syntax enable

" }}}

"Plugin Settings"  {{{

" deoplete.
let g:deoplete#enable_at_startup = 1

" denite
call denite#custom#var('file_rec', 'command', ['pt', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', 'command', ['pt'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'default_opts', ['--follow', '--no-group', '--no-color'])

" vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1 " default 0

" }}}

"Basic Settings"  {{{

let mapleader=","

set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set expandtab          "タブ入力を空白に変換
set hls                "検索した文字をハイライトする
set incsearch          "インクリメンタルサーチ
set nobackup
set novisualbell
set number             "行番号を表示
set shiftwidth=2       "自動インデント時に入力する空白の数
set smartindent
set splitright         "画面を縦分割する際に右に開く
set tabstop=2          "タブを何文字の空白に変換するか
set nowrapscan         " 検索を循環させない
set fileencodings=utf-8,cp932,euc-jp " 文字コードの自動解釈の優先順位
set fileformats=unix,dos " 改行コードの解釈優先順位
set encoding=utf-8 " 内部の解釈の文字コード　設定ファイルもこのコードで書け
set fileformat=unix " 内部の改行コード
set helplang=ja,en " helpの言語の優先順位

" }}}



"Denite"  {{{

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

" }}}
