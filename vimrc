"dein"  {{{

"dein Scripts-----------------------------
if &compatible
  set nocompatible " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.vim/bundles')
  " Required:
  call dein#begin('$HOME/.vim/bundles')

  call dein#add('$HOME/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Lokaltog/vim-easymotion')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Sixeight/unite-grep')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('basyura/unite-rails')
  call dein#add('bling/vim-airline')
  call dein#add('briancollins/vim-jst')
  call dein#add('chriskempson/vim-tomorrow-theme')
  call dein#add('csscomb/vim-csscomb')
  call dein#add('digitaltoad/vim-jade')
  call dein#add('duganchen/vim-soy')
  call dein#add('fatih/vim-go')
  call dein#add('fuenor/im_control.vim')
  call dein#add('gmarik/sudo-gui.vim')
  call dein#add('groenewege/vim-less')
  call dein#add('honza/vim-snippets')
  call dein#add('kana/vim-textobj-user')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('lilydjwg/colorizer')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('nazo/pt.vim')
  call dein#add('nono/vim-handlebars')
  call dein#add('osyo-manga/vim-over')
  call dein#add('othree/html5.vim')
  call dein#add('othree/yajs.vim')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('rhysd/github-complete.vim')
  call dein#add('rhysd/vim-textobj-ruby')
  call dein#add('rking/ag.vim')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('scrooloose/nerdtree')
  call dein#add('sjl/gundo.vim')
  call dein#add('slim-template/vim-slim')
  call dein#add('taku-o/vim-ro-when-swapfound')
  call dein#add('taku-o/vim-toggle')
  call dein#add('tell-k/vim-browsereload-mac')
  call dein#add('thinca/vim-fontzoom')
  call dein#add('thinca/vim-qfreplace')
  call dein#add('thinca/vim-quickrun')
  call dein#add('thinca/vim-ref')
  call dein#add('tomasr/molokai')
  call dein#add('tpope/vim-bundler')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-haml')
  call dein#add('tpope/vim-liquid')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-rake')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-surround')
  call dein#add('ujihisa/neco-look')
  call dein#add('ujihisa/rdoc.vim')
  call dein#add('ujihisa/unite-colorscheme')
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('vim-scripts/NERV-ous')
  call dein#add('vim-scripts/smartchr')
  call dein#add('vim-scripts/sudo.vim')
  call dein#add('vim-scripts/zoom.vim')
  call dein#add('w0ng/vim-hybrid')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

"End dein Scripts-------------------------

" }}}
"BASIC " {{{
"
" font
"set gfn=SCPM:h13
set gfn=ゆたぽん（コーディング）:h13
"set gfn=Ricty-Bold:h13
"set gfn=RictyDiscord-Bold:h13

set showcmd
let mapleader=","
" 行番号
set number
" 現在の行をハイライト
"set cursorline
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
set novisualbell
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
    " %s/\s\+$//ge
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

noremap <Leader>t :noautocmd vimgrep /TODO/j **/*.rb **/*.js **/*.coffee **/*.css **/*.sass **/*.spec **/*.erb **/*.haml **/*.slim<CR>:cw<CR>

" http://qiita.com/items/bd97a9b963dae40b63f5
vnoremap <silent> <C-p> "0p<CR>

au BufRead,BufNewFile *.hamlc set ft=haml
au BufRead,BufNewFile *.sass set ft=sass
au BufRead,BufNewFile *.slim set ft=slim
au BufRead,BufNewFile *.schema set ft=ruby

let g:ackprg = 'ag --nogroup --nocolor --column'

" enable clipboard on mac
set clipboard+=unnamed


" for performance
set re=1
set nocursorline
set norelativenumber
set nocursorcolumn
set guicursor=
" set synmaxcol=180
" syntax sync minlines=100 maxlines=1000

" }}}
"COLOR" {{{
"colorscheme nerv-ous
"colorscheme molokai
"let g:molokai_original=1

"set background=dark
"colorscheme solarized

"colorscheme Tomorrow-Night
"colorscheme Tomorrow-Night-Eighties
"colorscheme wombat
"colorscheme jellybeans
let g:hybrid_custom_term_colors = 1
let g:hybrid_use_Xresources = 1
"let g:hybrid_reduced_contrast = 1
set background=dark
colorscheme hybrid
" }}}
" Unite" {{{

  " for vim-airline
  let g:unite_force_overwrite_statusline = 0

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
  nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

  nnoremap <silent> ,uc :<C-u>Unite colorscheme -auto-preview<CR>


" }}}
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
" over.vim {{{
" http://qiita.com/PSP_T/items/3a1af1301ee197b32a8a

" over.vimの起動
nnoremap <silent> <Leader>m :OverCommandLine<CR>

" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

" }}}
" Rails.vim " {{{

let g:rails_projections = {
        \ "app/assets/javascripts/models/*.js.coffee": {
        \   "command": "jmodel",
        \   "alternate": "spec/javascripts/models/%s_spec.js.coffee",
        \   "template": "class @AppName.Models.%S extends Backbone.Model"
        \ },
        \ "app/assets/javascripts/collections/*.js.coffee": {
        \   "command": "jcollection",
        \   "alternate": "spec/javascripts/collections/%s_spec.js.coffee",
        \   "template": "class @AppName.Collections.%S extends Backbone.Collection"
        \ },
        \ "app/assets/javascripts/layouts/*.js.coffee": {
        \   "command": "jlayout",
        \   "alternate": "spec/javascripts/layouts/%s_spec.js.coffee",
        \   "related": "app/assets/templates/%s.jst.hamlc",
        \   "template": "class @AppName.Layouts.%S extends Backbone.Marionette.Layout"
        \ },
        \ "app/assets/javascripts/views/*.js.coffee": {
        \   "command": "jview",
        \   "alternate": "spec/javascripts/views/%s_spec.js.coffee",
        \   "related": "app/assets/templates/%s.jst.hamlc",
        \   "template": "class @AppName.Views.%S extends Backbone.Marionette.ItemView"
        \ },
        \ "app/assets/javascripts/controllers/*.js.coffee": {
        \   "command": "jcontroller",
        \   "alternate": "spec/javascripts/controllers/%s_spec.js.coffee",
        \   "template": "class @AppName.Controllers.%S"
        \ },
        \ "app/assets/javascripts/routers/*.js.coffee": {
        \   "command": "jrouter",
        \   "alternate": "spec/javascripts/routers/%s_spec.js.coffee",
        \   "template": "class @AppName.Routers.%S"
        \  },
        \ "spec/javascripts/*_spec.js.coffee": {
        \   "command": "jspec",
        \   "alternate": "app/assets/javascripts/%s.js.coffee"
        \ },
        \ "app/assets/javascripts/templates/*.jst.hamlc": {
        \   "command": "template",
        \   "alternate": "app/assets/javascripts/views/%s.js.coffee"
        \ },
        \ "app/decorators/*_decorator.rb": {
        \   "command": "decorator",
        \   "test": [
        \     "spec/decorators/%s_decorator_spec.rb"
        \   ]
        \ },
        \ "app/filters/*_filter.rb": {
        \   "command": "filter",
        \   "test": [
        \     "spec/filters/%s_filter_spec.rb"
        \   ]
        \ },
        \ "app/forms/*_form.rb": {
        \   "command": "form",
        \   "test": [
        \     "spec/forms/%s_form_spec.rb"
        \   ]
        \ },
        \ "app/jobs/*_job.rb": {
        \   "command": "job",
        \   "test": [
        \     "spec/jobs/%s_job_spec.rb"
        \   ]
        \ },
        \ "app/observers/*_observer.rb": {
        \   "command": "observer",
        \   "test": [
        \     "spec/observers/%s_observer_spec.rb"
        \   ]
        \ },
        \ "app/services/*_service.rb": {
        \   "command": "service",
        \   "spec": [
        \     "spec/services/%s_service_spec.rb"
        \   ]
        \ },
        \ "app/policies/*_policy.rb": {
        \   "command": "policy",
        \   "test": [
        \     "spec/policies/%s_policy_spec.rb"
        \   ]
        \ },
        \ "app/serializers/*_serializer.rb": {
        \   "command": "serializer",
        \   "related": "app/models/%s.rb",
        \   "spec": [
        \     "spec/serializers/%s_serializer_spec.rb"
        \   ]
        \ },
        \ "app/validators/*_validator.rb": {
        \   "command": "validator",
        \   "spec": [
        \     "spec/validators/%s_validator_spec.rb"
        \   ]
        \ },
        \ "app/uploaders/*_uploader.rb": {
        \   "command": "uploader",
        \   "test": [
        \     "spec/uploaders/%s_uploader_spec.rb"
        \   ]
        \ },
        \ "app/workers/*_worker.rb": {
        \   "command": "worker",
        \   "test": [
        \     "spec/workers/%_worker_spec.rb"
        \   ]
        \ }
        \}
" }}}
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

" rhysd/unite-ruby-require.vim
" Usage
" :Unite ruby/require
" This is for rbenv user
let g:unite_source_ruby_require_ruby_command = '$HOME/.rbenv/shims/ruby'

" 日付挿入
"imap <silent> <C-D><C-D> <C-R>=strftime("%Y-%m-%d")<CR>

imap <s-tab> <c-d>

" https://github.com/plasticboy/vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_conceal = 0

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" " }}}
