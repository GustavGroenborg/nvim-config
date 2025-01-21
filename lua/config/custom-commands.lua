-- Remapping common spelling mistakes
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Wq", "wq", {})

-- Opening window, by pressing button only accessible on mac...
vim.keymap.set({'n', 'i'}, '§', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set("n", "<C-e>", "<cmd> lua vim.diagnostic.open_float()<CR>")

-- Navigating errors
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto prev" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { desc = "Goto next" })
