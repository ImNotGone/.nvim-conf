call plug#begin('~/.config/nvim/plugged')
    " Theme
    " Plug 'drewtempelmeyer/palenight.vim'
    " Bar
    Plug 'https://github.com/vim-airline/vim-airline'
    " Autocompletion
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " LSP
    Plug 'neovim/nvim-lspconfig'
    " Plug 'hrsh7th/nvim-compe'
    " Telescope
    " Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " gruvBox
    Plug 'gruvbox-community/gruvbox'
call plug#end()

lua require('gone.options')
lua require('gone.keymaps')

colorscheme gruvbox
highlight Normal guibg=none

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
