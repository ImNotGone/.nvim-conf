local colorscheme = 'gruvbox'

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
    vim.notify('Colorsheme ' .. colorscheme .. ' not found!!')
    return
end
