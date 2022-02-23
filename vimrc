call plug#begin('~/.vim/plugged')

Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'

call plug#end()

nmap <C-f> :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag
nmap <C-p> :FZF <CR>

syntax enable
set tabstop=2
set softtabstop=2
set expandtab  "tabs are spaces"
:set shiftwidth=2
:set autoindent
:set smartindent

set number  "show line numbers"
set cursorline 
set backspace=indent,eol,start
set noshowmode

filetype plugin indent on

let g:ag_working_path_mode="r"

set laststatus=2

let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

set winaltkeys=no

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
