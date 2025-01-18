-- Importing vim default settings
vim.cmd("source /usr/share/vim/vim91/defaults.vim")

-- Replacing tabs with spaces
vim.opt.tabstop    = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab  = true

-- Improving navigation
vim.opt.ruler   = true
vim.opt.showcmd = true
vim.opt.history = 50

-- Configuring line numbers
vim.opt.number      = true
vim.opt.numberwidth = 4 -- TODO: consider changing this to a smaller number

-- Configuring highlighting
-- `0` sets highlight group globally as done with `:highlight`
vim.api.nvim_set_hl(0, "LineNr", { fg = "grey" })
vim.opt.is  = true -- incremental search or `incsearch`
vim.opt.hls = true -- highlight search or `hlsearch`

-- Backup files and undo files
vim.opt.backup   = true
vim.opt.undofile = true
