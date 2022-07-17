" number to the left is actual row
set number
" numbers go relative to the actual line
set relativenumber


" copy indent from current line when starting a new line
set autoindent
" tab = 4 space
set tabstop=4 softtabstop=4
" autoindent spaces
set shiftwidth=4
" allows to delete a tab using 1 <BS>
set smarttab
" inserts correct amount of spaces when tabbing
set expandtab


" executes vimrc in current folder
set exrc
" highligth search
set hlsearch

" sets def cursor
" set guicursor


" keeps a buffer in memory if you did not save
set hidden


" no sound on error
set noerrorbells
" screen flash on error
set visualbell


" no linewrapping
set nowrap


set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile


" incremental search
set incsearch
" scroll init dif
set scrolloff=8
" marks the 80th column
set colorcolumn=80
" adds an extra column for msg/errors
set signcolumn=yes
" faster saves to swp default is 4000ms
set updatetime=50
" # of columns for cmds
set cmdheight=2
set termguicolors

call plug#begin('~/.config/nvim/plugged')
    " Theme
    " Plug 'drewtempelmeyer/palenight.vim'
    " Bar
    Plug 'https://github.com/vim-airline/vim-airline'
    " Autocompletion
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " LSP
    " Plug 'neovim/nvim-lspconfig'
    " Plug 'hrsh7th/nvim-compe'
    " Telescope
    " Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " gruvBox
    Plug 'gruvbox-community/gruvbox'
call plug#end()

lua require('gmartone')

colorscheme gruvbox
highlight Normal guibg=none

" map l r
" normal mode, no recursive, map
let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

" to trim all remaining spaces on the file
function! Trim()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TrimOnSave
    " clear all of this auto
    autocmd!
    " EXEC Trim before saving
    autocmd BufWritePre * :call Trim()
augroup END

augroup Binary
    autocmd!
    " set the 'bin' option to true if the file I'm opening is a .bin
    au BufReadPre   *.bin,*.out let &bin=1

    " before I start editing set the binary editor
    au BufReadPost  *.bin,*.out if &bin | :%!xxd
    au BufReadPost  *.bin,*.out set ft=xxd | endif

    " before saving
    au BufWritePre  *.bin,*.out if &bin | :%!xxd -r
    au BufWritePre  *.bin,*.out endif

    " after saving
    au BufWritePost *.bin,*.out if &bin | :%!xxd
    au BufWritePost *.bin,*.out set nomod | endif
augroup END
