local lsp_installer = load_plugin('nvim-lsp-installer')
local lspconfig = load_plugin('lspconfig')

local path_to_lsp = 'gone.plugin_configs.lsp'
local path_to_settings = path_to_lsp .. '.settings'
local handler = load_file(path_to_lsp .. '.handlers')


local servers = {
    'sumneko_lua',
    'clangd',
    'cmake',
    'pyright',
    'bashls',
    'jdtls',
    'rust_analyser',
    'taplo',
}

local opts = {
    on_attach = handler.on_attach,
    capabilities = handler.capabilities,
}

lsp_installer.setup()

for _, server in pairs(servers) do

    if server == 'sumneko_lua' then
        local sumneko_opts = load_file(path_to_settings .. '.sumneko_lua')
        opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
    end

    if server == 'rust_analyser' then
        local keymap = vim.keymap.set
        local key_opts = { silent = true }

        keymap("n", "<leader>rh", "<cmd>RustSetInlayHints<Cr>", key_opts)
        keymap("n", "<leader>rhd", "<cmd>RustDisableInlayHints<Cr>", key_opts)
        keymap("n", "<leader>th", "<cmd>RustToggleInlayHints<Cr>", key_opts)
        keymap("n", "<leader>rr", "<cmd>RustRunnables<Cr>", key_opts)
        keymap("n", "<leader>rem", "<cmd>RustExpandMacro<Cr>", key_opts)
        keymap("n", "<leader>roc", "<cmd>RustOpenCargo<Cr>", key_opts)
        keymap("n", "<leader>rpm", "<cmd>RustParentModule<Cr>", key_opts)
        keymap("n", "<leader>rjl", "<cmd>RustJoinLines<Cr>", key_opts)
        keymap("n", "<leader>rha", "<cmd>RustHoverActions<Cr>", key_opts)
        keymap("n", "<leader>rhr", "<cmd>RustHoverRange<Cr>", key_opts)
        keymap("n", "<leader>rmd", "<cmd>RustMoveItemDown<Cr>", key_opts)
        keymap("n", "<leader>rmu", "<cmd>RustMoveItemUp<Cr>", key_opts)
        keymap("n", "<leader>rsb", "<cmd>RustStartStandaloneServerForBuffer<Cr>", key_opts)
        keymap("n", "<leader>rd", "<cmd>RustDebuggables<Cr>", key_opts)
        keymap("n", "<leader>rv", "<cmd>RustViewCrateGraph<Cr>", key_opts)
        keymap("n", "<leader>rw", "<cmd>RustReloadWorkspace<Cr>", key_opts)
        keymap("n", "<leader>rss", "<cmd>RustSSR<Cr>", key_opts)
        keymap("n", "<leader>rxd", "<cmd>RustOpenExternalDocs<Cr>", key_opts)

        load_plugin('rust-tools').setup {
            tools = {
                on_initialized = function()
                    vim.cmd [[
                        autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
                    ]]
                end,
            },
            server = {
                on_attach = handler.on_attach,
                capabilities = handler.capabilities,
                settings = {
                    ['rust_analyser'] = {
                        lens = {
                            enable = true,
                        },
                        checkOnSave = {
                            command = 'clippy',
                        },
                    },
                },
            },
        }
        goto continue
    end

    if server == 'jdtls' then
        goto continue
    end

    lspconfig[server].setup(opts)
    ::continue::
end
