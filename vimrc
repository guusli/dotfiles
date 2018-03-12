call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kchmck/vim-coffee-script'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'ajh17/VimCompletesMe'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'ternjs/tern_for_vim'
Plug 'zeekay/vim-beautify'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-sensible'

call plug#end()

map <C-k> :NERDTreeToggle<CR>
nmap <C-f> :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag
nmap <C-p> :FZF <CR>

syntax enable
set tabstop=2
set softtabstop=2
set expandtab  "tabs are spaces"

set number  "show line numbers"
set cursorline 

filetype plugin indent on

let g:ag_working_path_mode="r"

set laststatus=1

let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

set winaltkeys=no

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = [ 'rubocop']
let g:syntastic_scss_checkers = [ 'scss_lint']

let g:airline_theme='solarized'

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
