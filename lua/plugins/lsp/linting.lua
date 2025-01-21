return {
    {
        "mfussenegger/nvim-lint",
        config = function ()
            require("lint").linters_by_ft = {
                -- Add linters like shown below
                -- lua = { "luacheck" }
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
    },
    {
        "saghen/blink.cmp",
        version = "*",
        opts = {
            completion = {
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = true
                    },
                },
            },
            sources = {
                default = { "lazydev", "lsp", "path", "buffer" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    }
                },
            },
        },
    },
}
