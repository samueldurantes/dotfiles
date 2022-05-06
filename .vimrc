let g:python3_host_prog = '/usr/bin/python'

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'ShinKage/idris2-nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'whonore/Coqtail'
Plug 'samueldurantes/vim-kind'
call plug#end()

let maplocalleader = ','

syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
set guicursor=i:block
" set nowrap
set autoindent
set showmode

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

au BufNewFile,BufRead *.kind set filetype=kind
au BufNewFile,BufRead *.hl set syntax=lisp
au BufNewFile,BufRead *.hvm set filetype=hvm
au BufNewFile,BufRead *.hvm set syntax=javascript
au BufNewFile,BufRead *.kind2 set syntax=javascript

nnoremap <expr> r ':!time hvm r %<cr>'
nnoremap <C-c> :split<cr>
nnoremap <C-x> :vsplit<cr>
nnoremap <Tab> :bn<cr>
nnoremap <S-Tab> :bp<cr>

augroup haMaps
 au FileType haskell nmap <buffer> <leader>n <Plug>(coc-diagnostic-next)
 au FileType haskell nmap <buffer> <leader>N <Plug>(coc-diagnostic-prev)
 au FileType haskell nmap <buffer> <leader>t <Plug>(coc-type-definition)
 au FileType haskell nmap <buffer> <leader>d <Plug>(coc-definition)
 au FileType haskell nmap <buffer> <leader>i <Plug>(coc-implementation)
 au FileType haskell nmap <buffer> <leader>r <Plug>(coc-references)
 au FileType haskell nmap <buffer> <leader>h :call CocActionAsync('doHover')<CR>
augroup END

let g:coqtail_noimap = 1
augroup coqMaps
  au!
  au FileType coq noremap <buffer> <F10> :CoqRestorePanels<CR>
  au FileType coq noremap <buffer> <Down>  :CoqNext<CR>
  au FileType coq noremap <buffer> <Up>  :CoqUndo<CR>
  au FileType coq noremap <buffer> <C-j>  :CoqNext<CR>
  au FileType coq noremap <buffer> <C-K> :CoqUndo<CR>
  au FileType coq setlocal comments=sO:*\ -,mO:*\ \ ,exO:*),s1:(*,mb:*,ex:*)
augroup END

lua << EOF

-- shortcut for displaying error messages in a popup.
vim.cmd [[nnoremap <LocalLeader><LocalLeader>e <Cmd>lua vim.diagnostic.open_float()<CR>]]
-- shortcut for displaying error messages in a separate window.
vim.cmd [[nnoremap <LocalLeader><LocalLeader>el <Cmd>lua vim.diagnostic.setloclist()<CR>]]

-- command to run after every code action.
local function save_hook(action)
  vim.cmd('silent write')
end

local opts = {
  client = {
    hover = {
      use_split = false, -- Persistent split instead of popups for hover
      split_size = '30%', -- Size of persistent split, if used
      auto_resize_split = false, -- Should resize split to use minimum space
      split_position = 'bottom', -- bottom, top, left or right
      with_history = false, -- Show history of hovers instead of only last
    },
  },
  server = {
    on_attach = function(...)
      vim.cmd [[nnoremap gd <Cmd>lua vim.lsp.buf.definition()<CR>]]
      vim.cmd [[nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>]]

      vim.cmd [[nnoremap <LocalLeader>c <Cmd>lua require('idris2.code_action').case_split()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>mc <Cmd>lua require('idris2.code_action').make_case()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>mw <Cmd>lua require('idris2.code_action').make_with()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>ml <Cmd>lua require('idris2.code_action').make_lemma()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>a <Cmd>lua require('idris2.code_action').add_clause()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>o <Cmd>lua require('idris2.code_action').expr_search()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>gd <Cmd>lua require('idris2.code_action').generate_def()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>rh <Cmd>lua require('idris2.code_action').refine_hole()<CR>]]

      vim.cmd [[nnoremap <LocalLeader>so <Cmd>lua require('idris2.hover').open_split()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>sc <Cmd>lua require('idris2.hover').close_split()<CR>]]

      vim.cmd [[nnoremap <LocalLeader>mm <Cmd>lua require('idris2.metavars').request_all()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>mn <Cmd>lua require('idris2.metavars').goto_next()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>mp <Cmd>lua require('idris2.metavars').goto_prev()<CR>]]

      vim.cmd [[nnoremap <LocalLeader>br <Cmd>lua require('idris2.browse').browse()<CR>]]

      vim.cmd [[nnoremap <LocalLeader>x <Cmd>lua require('idris2.repl').evaluate()<CR>]]
    end,
    init_options = {
      logFile = "~/.cache/idris2-lsp/server.log",
      longActionTimeout = 2000, -- 2 second
    },
  },
  autostart_semantic = true, -- Should start and refresh semantic highlight automatically
  code_action_post_hook = save_hook, -- Function to execute after a code action is performed:
  use_default_semantic_hl_groups = true, -- Set default highlight groups for semantic tokens
}
require('idris2').setup(opts)
EOF
