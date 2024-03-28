syntax on

set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set nowrap
set noshowmode
set belloff=all
set noswapfile
set nobackup
set nowb

set hlsearch
set incsearch

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Install packages
call plug#begin()
  Plug 'editorconfig/editorconfig-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/nerdtree'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'morhetz/gruvbox'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'tpope/vim-fugitive'
  " Plug 'whonore/Coqtail'
  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install --frozen-lockfile --production',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()

" Coc
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Backwards tab
imap <S-Tab> <C-d>

" NERDTree
let NERDTreeShowHidden=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
nmap <C-b> :NERDTreeToggle<CR>

" Git
nmap <C-g> :Gvdiffsplit<CR>

" Airline
let g:airline_powerline_fonts = 0
let g:airline_theme = 'owo'
let g:airline_section_warning = ''
let g:airline_inactive_collapse = 0
let g:airline#extensions#default#section_truncate_width = {
  \ 'a': 60,
  \ 'b': 80,
  \ 'x': 100,
  \ 'y': 100,
  \ 'z': 60,
\ }

" Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Coqtail
" let g:coqtail_noimap = 1
" augroup coqMaps
"   au!
"   au FileType coq noremap <buffer> <F10> :CoqRestorePanels<CR>
"   au FileType coq noremap <buffer> <Down>  :CoqNext<CR>
"   au FileType coq noremap <buffer> <Up>  :CoqUndo<CR>
"   au FileType coq noremap <buffer> <C-j>  :CoqNext<CR>
"   au FileType coq noremap <buffer> <C-K> :CoqUndo<CR>
"   au FileType coq setlocal comments=sO:*\ -,mO:*\ \ ,exO:*),s1:(*,mb:*,ex:*)
" augroup END
