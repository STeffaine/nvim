vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"

-- Highlight serach
vim.opt.hlsearch = true

-- don't show mode, its in the status line
vim.opt.showmode = false

vim.opt.breakindent = true

vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

-- Sets how neovim will display certain whitespace characters in the editor
vim.opt.list = true
vim.opt.listchars = { tab = "   ", trail = "·", nbsp = "␣" }

-- Preview substitutions live
vim.opt.inccommand = "split"

-- Show which line cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8

-- Set tabstop stuff.
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.listchars = {
    tab = '  ',      -- Character to show for tabs
    trail = '·',     -- Character to show for trailing spaces
    extends = '>',   -- Character to show for wrapped lines
    precedes = '<',  -- Character to show for indentations (e.g., in insert mode)
}

vim.opt.termguicolors = true


-- Setup filetype detection for docker-compose.yml
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "docker-compose*.yml",
  callback = function()
    vim.bo.filetype = "dockercompose"
  end,
})

