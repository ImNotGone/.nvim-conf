local config = load_plugin('nvim-treesitter.configs')

config.setup {
    ensure_installed = {
        'bash',
        'c', 'cpp', 'c_sharp', 'make', 'cmake',
        'lua', 'vim', 'yaml',
        'java', 'kotlin',
        'html', 'css', 'javascript', 'typescript',
        'bibtex', 'latex', 'markdown',
        'comment',  -- better comments
        --'gitignore',
        'python',
        'rust', 'toml',
        'ruby',
        'solidity',
        'sql',
    },
    sync_install = false,
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
        disable = {},
    },
    autopairs = {
        enable = true
    },
    -- TODO context_commentstring
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
}
