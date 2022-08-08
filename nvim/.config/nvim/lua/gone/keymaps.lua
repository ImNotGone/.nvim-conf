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

-- C -> ctrl
-- S -> shift
-- A -> alt

-- Normal mode
--  Better window movement
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

--  Move lines
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

--  Leader shortcuts
keymap("n", "<leader>e", ":Lex 30<CR>", opts)
keymap("n", "<leader>r", ":!gcc -pedantic -std=c99 -Wall hello.c & ./a.out<CR>", opts)

-- Insert Mode
--  Move lines
keymap("i", "<A-j>", "<ESC>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<ESC>:m .-2<CR>==gi", opts)

-- Visual mode
--  Indent lines with ">" and "<"
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

--  Move lines -- redo :)
--keymap("v", "<A-j>", "<ESC>:m .+1<CR>==gv", opts)
--keymap("v", "<A-k>", "<ESC>:m .-2<CR>==gv", opts)

