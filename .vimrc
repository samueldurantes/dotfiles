call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme gruvbox
set background=dark

syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
set guicursor=i:block

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

au BufNewFile,BufRead *.kind set filetype=kind
au BufNewFile,BufRead *.hl set syntax=lisp
au BufNewFile,BufRead *.hvm set filetype=hvm
au BufNewFile,BufRead *.hvm set syntax=javascript

:nnoremap <expr> r ':!time kind %<cr>'
