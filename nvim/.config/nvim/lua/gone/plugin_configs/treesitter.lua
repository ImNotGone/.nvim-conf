local config = load_plugin('nvim-treesitter.configs')

config.setup {
    ensure_installed = 'all',
    sync_install = false,
    ignore_install = {'phpdoc'},
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true,
        disable = {},
    },
    autopairs = {
        enable = true
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
}
