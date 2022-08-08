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

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- use a protected call to not get errors on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Make packer use a pop up window
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
}

-- Packages go here
return packer.startup(
    function(use)

        -- === Plugins ===

        use 'wbthomason/packer.nvim'        -- Have packer manage itself
        use 'nvim-lua/popup.nvim'           -- Popup api from vim in nvim
        use 'nvim-lua/plenary.nvim'         -- Lua helpfull functions

        -- Colorsheme
        use 'gruvbox-community/gruvbox'

        -- Snippets
        use 'L3MON4D3/LuaSnip'              -- Snippet Engine
        use 'rafamadriz/friendly-snippets'  -- More Snippets

        -- Completion plugins
        use 'hrsh7th/nvim-cmp'              -- The completion plugin
        use 'hrsh7th/cmp-buffer'            -- buffer completions
        use 'hrsh7th/cmp-path'              -- path completions
        use 'hrsh7th/cmp-cmdline'           -- cmdline completions
        use 'saadparwaiz1/cmp_luasnip'      -- snippet completions

        -- Telescope
        use 'nvim-telescope/telescope.nvim'

        -- ===   End   ===

        -- After cloning packer.nvim, it automatically sets up our config
        if PACKER_BOOTSTRAP then
            require('packer').sync()
        end
    end
)
