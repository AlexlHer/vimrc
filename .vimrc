set nocompatible
set encoding=UTF-8
set background=dark
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set autowrite       " Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set mouse=a         " Enable mouse usage (all modes)
set ttymouse=sgr
set number
set shiftwidth=4
set smartindent
set autoindent
set backspace=indent,eol,start
set showmode
set ruler
set cursorline
set linebreak

if has("autocmd")
    filetype plugin indent on
endif
if has("syntax")
    syntax on
endif


" ---------Plugins :-----------
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'preservim/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'ryanoasis/vim-devicons'
Plug 'voldikss/vim-floaterm'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sleuth'

call plug#end()
" -------Fin plugins.----------


" -------Monokai :-------
let g:vim_monokai_tasty_italic = 0
colorscheme vim-monokai-tasty


" -------NERDTree :-------
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
    
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror


" -------Floaterm :-------
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
