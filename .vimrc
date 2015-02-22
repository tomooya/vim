set nocompatible
filetype off            " for NeoBundle
 
if has('vim_starting')
	set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
 
" ここから NeoBundle でプラグインを設定します
" NeoBundle で管理するプラグインを追加します。
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/unite.vim.git'

" solarized
NeoBundle 'altercation/vim-colors-solarized'
" mustang
NeoBundle 'croaker/mustang-vim'
" jellybeans
NeoBundle 'nanotech/jellybeans.vim'
" molokai
NeoBundle 'tomasr/molokai'

" NERTDTree
"NeoBundle 'scrooloose/nerdtree'
" VimFiler
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
" quickrun
NeoBundle 'thinca/vim-quickrun'
"syntastic 
"NeoBundle 'scrooloose/syntastic'

" vim-tags
NeoBundle 'szw/vim-tags'

" for python
" jedi-vim
NeoBundle 'davidhalter/jedi-vim'
" flake8
"NeoBundle 'Flake8-vim'
" syntastic
"NeoBundle 'scrooloose/syntastic'

" English Dictionary
" sudo apt-get install lynx
" sudo vi /etc/lynx-cur/lynx.cfg
" change-> CHARACTER_SET:utf-8
" change-> PREFERRED_LANGUAGE:ja
NeoBundle 'thinca/vim-ref'
NeoBundle 'mfumi/ref-dicts-en'
NeoBundle 'tyru/vim-altercmd'

" DO NeoBundleInstall
" DO NeoBundleUpdate
" DO NeoBundleClean 

call neobundle#end()

" quickrun
let g:quickrun_config = {
\	"_" : {
\		"outputter/buffer/split" : ":botright 8sp",
\	}
\}

"pyflake
let g:PyFlakeDisableMessages = "E113"

" English Dictionary
autocmd FileType ref-* nnoremap <buffer> <silent> q :<C-u>close<CR>

" 辞書定義
let g:ref_source_webdict_sites = {
\   'je': {
\     'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
\   },
\   'ej': {
\     'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
\   },
\   'weblio': {
\     'url': 'http://ejje.weblio.jp/content/%s',
\     'keyword_encoding': 'utf-8',
\     'cache': 1,
\   },
\   'wiki': {
\     'url': 'http://ja.wikipedia.org/wiki/%s',
\   }
\ }

" デフォルトサイト
"let g:ref_source_webdict_sites.default = 'ej'
" 出力に対するフィルタ
" 最初の数行を削除
function! g:ref_source_webdict_sites.je.filter(output)
  return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.ej.filter(output)
  return join(split(a:output, "\n")[15 :], "\n")
endfunction

" デフォルトサイト
let g:ref_source_webdict_sites.default = 'weblio'
function! g:ref_source_webdict_sites.weblio.filter(output)
	return join(split(a:output, "\n")[53 :], "\n")
endfunction
function! g:ref_source_webdict_sites.wiki.filter(output)
	return join(split(a:output, "\n")[17 :], "\n")
endfunction

call altercmd#load()
CAlterCommand ej Ref webdict ej
CAlterCommand je Ref webdict je
CAlterCommand dict Ref webdict weblio
CAlterCommand wiki Ref webdict wiki

filetype plugin indent on       " restore filetype

"colorscheme molokai 
"if &term =~ "xterm-256color" || "screen-256color"
"	set t_Co=256
"	set t_Sf=[3%dm
"	set t_Sb=[4%dm
"elseif &term =~ "xterm-color"
"	set t_Co=8
"	set t_Sf=[3%dm
"	set t_Sb=[4%dm
"endif

syntax on

"---my setting-----------------------------------
set number
set ic
set showmatch
set nowrap
set background=dark

"---higly recommended-----------------------------
"コマンドライン補完を便利に
set wildmenu

"タイプ途中のコマンドを画面最下行に表示
set showcmd

"検索語を強調表示
set hlsearch

"モードラインは脆弱性があるので、代わりにsecuremodelingsスクリプトを使う
set nomodeline

"---Usability options-----------------------------
"検索時に大文字小文字を区別しない
set ignorecase
set smartcase

"オートインデント、開業インサートモード開始直後にバックスペース削除を有効
set backspace=indent,eol,start

"オートインデント
set autoindent

"移動コマンドを使ったとき、行頭に移動しない
set nostartofline

"画面最下行にルーラーを表示
set ruler

"statesラインを常に表示
set laststatus=2

"バッファが変更されているとき、コマンドをエラーにしないで、保存するかを確認
set confirm

" Use visual bell instead of beeping when doing something wrong
" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set visualbell

set t_vb=
set mouse=a
set cmdheight=2
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>

set tabstop=4
set softtabstop=4
set noexpandtab

set shiftwidth=4
set encoding=utf-8

" ヤンクなどで * レジスタにも書き込む
set clipboard=unnamed

" ヤンクなどで + レジスタにも書き込む
if has('unnamedplus')
  set clipboard+=unnamedplus
endif

" keymap
map e $a
nmap <C-g> :GtagsCursor
nmap <C-i> :Gtags -f %<CR>
nmap <C-j> :Gtags <C-r><C-w><CR>
nmap <C-k> :Gtags -r <C-r><C-w><CR>
nmap <C-d> :Gtags
nmap <C-n> :cn<CR>

nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

