-- Importing vim default settings
vim.cmd("source /usr/share/vim/vim91/defaults.vim")

-- Replacing tabs with spaces
vim.opt_global.tabstop    = 4
vim.opt_global.shiftwidth = 4
vim.opt_global.expandtab  = true

-- Improving navigation
vim.opt_global.ruler   = true
vim.opt_global.showcmd = true
vim.opt_global.history = 50

-- Configuring line numbers
vim.opt_global.number      = true
vim.opt_global.numberwidth = 4 -- TODO: consider changing this to a smaller number

-- Configuring highlighting
-- `0` sets highlight group globally as done with `:highlight`
vim.api.nvim_set_hl(0, "LineNr", { fg = "grey" })
vim.opt_global.is  = true -- incremental search or `incsearch`
vim.opt_global.hls = true -- highlight search or `hlsearch`

-- Backup files and undo files
vim.opt_global.backup   = true
vim.opt_global.undofile = true
