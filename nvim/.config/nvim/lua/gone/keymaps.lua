-- keymap options
-- noremap -> non recursive map
-- silent  ->
local opts = { noremap = true, silent = true}

local term_opts = { silent = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap

-- Set up space as local leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  normal_mode         = "n"
--  insert_mode         = "i"
--  visual_mode         = "v"
--  visual_block_mode   = "x"
--  term_mode           = "t"
--  command_mode        = "c"

-- Normal mode
--  Better window movement
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

--  Leader shortcuts
keymap("n", "<leader>e", ":Lex 30<CR>", opts)

-- Visual mode
--  Indent lines with ">" and "<"
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

--  Move lines up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)


