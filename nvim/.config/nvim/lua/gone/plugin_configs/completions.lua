-- safe load cmp
local cmp = load_plugin('cmp')

-- safer load luasnip
local luasnip = load_plugin('luasnip')

load_plugin('luasnip.loaders.from_vscode').lazy_load()

-- check for backspace
local check_bs = function()
    local col = vim.fn.col '.' - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s'
end

local kind_icons = {
  Text = '',
  Method = 'm',
  Function = '',
  Constructor = '',
  Field = '',
  Variable = '',
  Class = '',
  Interface = '',
  Module = '',
  Property = '',
  Unit = '',
  Value = '',
  Enum = '',
  Keyword = '',
  Snippet = '',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = '',
  Event = '',
  Operator = '',
  TypeParameter = '',
}


cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = {
        -- Move between options
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),

        -- Move inside the docs
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1),  {'i', 'c'}),

        --
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete, {'i', 'c'}),

        -- close window
        ['<C-e>'] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expandable() then
                    luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif check_bs() then
                    fallback()
                else
                    fallback()
                end
            end,
                {'i', 's'}
        ),
        ['<S-Tab>'] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end,
                {'i', 's'}
        ),
    },

    formatting = {
        fields = {'kind', 'abbr', 'menu'},
        format =
        function(entry, item)
            -- Icons
            -- item.kind = string.format('%s', kind_icons[item.kind])
            item.kind = string.format('%s %s', kind_icons[item.kind], item.kind)

            -- Menu
            item.menu = ({
                nvim_lsp = '[LSP]',
                nvim_lua = '[LUA_CFG]',
                luasnip  = '[Snippet]',
                buffer   = '[Buffer]',
                path     = '[Path]',
            })[entry.source.name]

            return item
        end
    },

    sources = {
        {name = 'nvim_lsp_signature_help'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'luasnip'},
        {name = 'buffer'},
        {name = 'path'},
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select   = false,
    },
    experimental = {
        ghost_text  = false,
        native_menu = false,
    },
}
