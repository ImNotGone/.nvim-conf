local options = {
    number = true,              -- set numbered lines
    relativenumber = true,      -- set relative numbered lines
    numberwidth = 4,            -- columns used for number/relativenumber
    signcolumn = "yes",         -- adds an extra column for errors
    -- mouse='a',
    -- search
    hlsearch = true,            -- highlights current search
    incsearch = true,           -- incremental search
    --

    hidden = true,              -- keeps a buffer in memory if you did not save
    errorbells = false,       	-- no sound on error
    visualbell = true,          -- screenflash on error
    wrap = false,             	-- no line wrapping

    -- backup
    swapfile = false,           --
    backup = false,             --
    undofile = true,            --
    updatetime = 50,            --
    -- undodir = "~/.config/nvim/undodir",
    --
    -- tab options
    smartindent = true,         -- indenting 1
    autoindent = true,          -- indenting 2
    tabstop = 4,                -- insert 4 spaces for a tab
    softtabstop = 4,            --
    shiftwidth = 4,             -- number of spaces per indentation
    smarttab = true,            --
    expandtab = true,           -- convert tab to spaces
    --

    scrolloff = 8,              --
    sidescrolloff = 8,          --
    colorcolumn = "80",         --
    cmdheight = 2,              --
    clipboard = "unnamedplus",  --
    splitright = true,          -- force vertical splits right
    splitbelow = true,          -- force horizontal splits below
    -- termiguicolors = true,   --
    guifont = "monospace:h17",  --
}

for k, v in pairs(options) do
    -- vim.opt."k" = v
    vim.opt[k] = v
end

-- adds "-" to the list of keywords, so you can do "dw" on "smth-smth"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set undodir=~/.config/nvim/undodir]]

