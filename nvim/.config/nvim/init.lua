require('gone.options')
require('gone.plugins')
require('gone.keymaps')
require('gone.colorscheme')
require('gone.plugin_configs.completions')

-- to trim all remaining spaces on the file
vim.cmd [[
function! Trim()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun ]]

vim.cmd [[
augroup TrimOnSave
    " clear all of this auto
    autocmd!
    " EXEC Trim before saving
    autocmd BufWritePre * :call Trim()
augroup END ]]

vim.cmd [[
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
augroup END ]]
