-- safe_load allows for loading without huge errors in case of missing
-- files or plugins
local function safe_load(to_load, type)
    local status_ok, resp = pcall(require, to_load)
    if not status_ok then
        vim.notify('Error loading ' .. type .. ': ' .. to_load)
        return
    end
    return resp
end

function load_file(path)
    return safe_load(path, 'file')
end

function load_plugin(plugin)
    return safe_load(plugin, 'plugin')
end

-- safe load plugins (./lua/gone/plugins.lua)
load_file('gone.plugins')

-- safe load options (./lua/gone/options.lua)
load_file('gone.options')

-- safe load keymaps (./lua/gone/keymaps.lua)
load_file('gone.keymaps')

-- safe load colorscheme (./lua/gone/colorscheme.lua)
load_file('gone.colorscheme')

-- safe load plugin_configs (./lua/gone/plugin_configs/init.lua)
load_file('gone.plugin_configs')


-- to trim all remaining spaces on the file
vim.cmd [[
    function! Trim()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfun
]]

vim.cmd [[
    augroup TrimOnSave
        autocmd!
        autocmd BufWritePre * :call Trim()
    augroup end
]]

vim.cmd [[
    augroup Binary
        autocmd!
        au BufReadPre   *.bin,*.out let &bin=1

        au BufReadPost  *.bin,*.out if &bin | :%!xxd
        au BufReadPost  *.bin,*.out set ft=xxd | endif

        au BufWritePre  *.bin,*.out if &bin | :%!xxd -r
        au BufWritePre  *.bin,*.out endif

        au BufWritePost *.bin,*.out if &bin | :%!xxd
        au BufWritePost *.bin,*.out set nomod | endif
    augroup end
]]
