local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim"
    vim.cmd([[packadd packer.nvim]])
end

vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Safe load packer
local packer = load_plugin('packer')

-- Make packer use a pop up window
packer.init {
    display = {
        open_fn = function()
            return load_plugin('packer.util').float { border = 'rounded' }
        end,
    },
}

-- Packages go here
return packer.startup(
    function(use)

        -- === Plugins ===
        -- Stuff
        use 'wbthomason/packer.nvim'        -- Have packer manage itself
        use 'nvim-lua/popup.nvim'           -- Popup api from vim in nvim
        use 'nvim-lua/plenary.nvim'         -- Lua helpfull functions
        use  {
            'nvim-lualine/lualine.nvim',    -- statusline
            requires = {'kyazdani42/nvim-web-devicons', opt = true},
        }
        use {
            'kyazdani42/nvim-tree.lua',
            -- for nice icons
            requires = {'kyazdani42/nvim-web-devicons',},
        }
        use 'windwp/nvim-autopairs'         -- () autocompletion
        use 'numToStr/Comment.nvim'
        use 'akinsho/toggleterm.nvim'       -- toggleterm
        use 'ahmedkhalf/project.nvim'       -- projects

        use 'goolord/alpha-nvim'

        -- Colorsheme
        use 'gruvbox-community/gruvbox'

        -- Completion plugins
        use 'hrsh7th/nvim-cmp'              -- The completion plugin
        use 'hrsh7th/cmp-buffer'            -- buffer completions
        use 'hrsh7th/cmp-path'              -- path completions
        use 'hrsh7th/cmp-cmdline'           -- cmdline completions
        use 'hrsh7th/cmp-nvim-lsp'          -- lsp completions
        use 'hrsh7th/cmp-nvim-lua'          -- config files completions
        use 'hrsh7th/cmp-nvim-lsp-signature-help'   -- signature completions
        use 'saadparwaiz1/cmp_luasnip'      -- snippet completions

        -- Snippets
        use 'L3MON4D3/LuaSnip'              -- Snippet Engine
        use 'rafamadriz/friendly-snippets'  -- More Snippets

        -- LSP
        use 'neovim/nvim-lspconfig'             -- enable LSP
        use 'williamboman/nvim-lsp-installer'   -- LS installer
        use 'jose-elias-alvarez/null-ls.nvim'   -- for formaters and linters
        use 'github/copilot.vim'                -- github copilot
        use 'mfussenegger/nvim-jdtls'           -- jdtls
        use 'simrat39/rust-tools.nvim'          -- rust tools

        -- Telescope
        use 'nvim-telescope/telescope.nvim'     -- dependency on ripgrep

        -- Treesitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = 'TSUpdate'
        }
        use 'p00f/nvim-ts-rainbow'
        use 'nvim-treesitter/playground'        -- for creating highlights
        use 'JoosepAlviste/nvim-ts-context-commentstring'

        -- Git
        use 'lewis6991/gitsigns.nvim'

        -- ===   End   ===

        -- After cloning packer.nvim, it automatically sets up our config
        if PACKER_BOOTSTRAP then
            packer = load_plugin('packer')
            packer.sync()
        end
    end
)
