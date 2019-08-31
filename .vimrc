" Basic {{{
" Encoding
set fileencodings=utf-8
set encoding=utf-8
set termencoding=utf-8

" Backup & Swap
set nobackup
set noswapfile

" Auto read
set autoread

" Auto indent
set autoindent

" Tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Tab - html
augroup OmniCompletionGroup
  autocmd! OmniCompletionGroup
  autocmd FileType html setl expandtab tabstop=2 shiftwidth=2 softtabstop=2
augroup END

" Tab - whitespace
set list
set listchars=eol:$,tab:>\ ,extends:<

" Line style
set number
set ruler
set cursorline

" Search highlight
set hlsearch

" Folding by marker
set fdm=marker

" Markdown でフォントを斜体表示にしない
" http://qiita.com/rbtnn/items/58a68e4981c52b1872ad
autocmd! FileType markdown hi! def link markdownItalic Normal
" }}}

" Keybind {{{
noremap ; :
noremap : ;

" Esc key map
imap <C-g> <esc>
vmap <C-g> <esc>
" }}}

" Appearance {{{
" Color
colorscheme desert
set t_Co=256
syntax enable

" Syntax
augroup FileTypeGroup
  autocmd! FileTypeGroup
  autocmd BufNewFile,BufRead *.vimrc set filetype=vim
  autocmd BufNewFile,BufRead *.html set filetype=html
  autocmd BufNewFile,BufRead *.erb set filetype=html
  autocmd BufNewFile,BufRead *.css set filetype=css
  autocmd BufNewFile,BufRead *.scss set filetype=scss
  autocmd BufNewFile,BufRead *.js set filetype=javascript
augroup END
" }}}

" Bundle {{{
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Let NeoBundle manage NeoBundle
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'vim-scripts/css_color.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-scripts/Align'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'kana/vim-submode'
call neobundle#end()
" }}}

" Enable filetype plugins
filetype plugin indent on

" GVim
set guifont=Menlo\ Regular:h20
