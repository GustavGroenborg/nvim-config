return {
    "mfussenegger/nvim-lint",
    config = function ()
        require("lint").linters_by_ft = {
            lua = { "luacheck" }
        }

        vim.api.nvim_create_autocmd(
            { "BufWritePost" },
            {
                callback = function()
                    -- runs linters defined in `linters_by_ft`
                    require("lint").try_lint()
                end
            }
        )
    end
}
