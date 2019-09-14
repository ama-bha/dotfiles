set nocompatible
set directory=/tmp
set expandtab
set tabstop=4
set nocompatible
syntax on
filetype plugin indent on

set nowrap
set et
set ts=4
set sw=4
set autoindent
set textwidth=200
set sft
set ignorecase
set autoindent
filetype indent on

""inoremap ( ()<ESC>i
""inoremap { {}<ESC>i
""inoremap [ []<ESC>i
""inoremap " ""<ESC>i


let mapleader = "`"
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>h :help<cr>

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>cc `<i/*<esc>`>a*/<esc>
vnoremap <leader>hc :s/^/#/g<cr>
inoremap jj j
inoremap jk <esc> 
inoremap <esc> <nop>


nnoremap <leader>pa "ap
nnoremap <leader>pb "bp
nnoremap <leader>pc "cp


nnoremap <leader>sp :set paste<cr>i
nnoremap <leader>np :set paste!<cr>

set laststatus=2

