-- safe load null_ls
local null_ls = load_plugin('null-ls')

-- Config
local formatting = null_ls.builtins.formatting

local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    debug = false,
    sources = {
        -- Sources here
    },
}
