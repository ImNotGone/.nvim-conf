-- keymap options
-- noremap -> non recursive map
-- silent  ->
local opts = { noremap = true, silent = true}

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

--  Resize with arrows
keymap("n", "<C-Up>",    ":resize -2<CR>", opts)
keymap("n", "<C-Down>",  ":resize +2<CR>", opts)
keymap("n", "<C-Left>",  ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--  Move lines
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

--  Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

--  Leader shortcuts
keymap("n", "<leader>e", ":Lex 30<CR>", opts)
keymap("n", "<leader>r", ":!gcc -pedantic -std=c99 -Wall hello.c & ./a.out<CR>", opts)

--  Telescope
keymap("n", "<leader>ff", "<CMD>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<CMD>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({height=10}))<CR>", opts)
keymap("n", "<leader>fh", "<CMD>Telescope help_tags<CR>", opts)
keymap("n", "<leader>fw", "<CMD>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({height=10, previewer=false}))<CR>", opts)
keymap("n", "<leader>fp", "<CMD>Telescope project<CR>", opts)
keymap("n", "<leader>fs", "<CMD>Telescope lsp_document_symbols<CR>", opts)
keymap("n", "<leader>fS", "<CMD>Telescope lsp_workspace_symbols<CR>", opts)
keymap("n", "<leader>fd", "<CMD>Telescope diagnostics<CR>", opts)
keymap("n", "<leader>fa", "<CMD>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>fk", "<CMD>Telescope keymaps<CR>", opts)


-- Insert Mode
--  Move lines
keymap("i", "<A-j>", "<ESC>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<ESC>:m .-2<CR>==gi", opts)

-- Visual mode
--  Indent lines with ">" and "<"
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

--  Move lines -- redo :)
-- keymap("v", "<A-j>", "<ESC>:m .+1<CR>==gv", opts)
-- keymap("v", "<A-k>", "<ESC>:m .-2<CR>==gv", opts)

-- Terminal
--  Better window movement
local term_opts = { silent = true }

keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
