return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                {
                    path  = "${3rd}/luz/library",
                    words = { "vim%.uv" },
                },
                -- Heaps of examples available on library GitHub
            },
        },
        enabled = function(root_dir)
            return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
        end,
    },
    { -- Neovim lsp
        "neovim/nvim-lspconfig",
        event = "BufAdd", -- Consider if this is necessary
        config = function ()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    local function getOpts(customDesc)
                        return {
                            buffer = ev.buf,
                            desc   = customDesc,
                        }
                    end

                    -- Where "n" denotes normal mode
                    vim.keymap.set(
                        "n",
                        "gD",
                        vim.lsp.buf.declaration, getOpts("Goto declaration")
                    )
                    vim.keymap.set(
                        "n",
                        "gd",
                        vim.lsp.buf.definition, getOpts("Goto definition")
                    )
                    vim.keymap.set(
                        "n",
                        "gi",
                        vim.lsp.buf.implementation,
                        getOpts("Goto implementation")
                    )
                    vim.keymap.set(
                        "n",
                        "<C-k>",
                        vim.lsp.buf.signature_help,
                        getOpts("Signature help")
                    )
                    vim.keymap.set(
                        "n",
                        "gr",
                        vim.lsp.buf.references,
                        getOpts("Goto references")
                    )
                end,
            })
        end,
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
        build  = ":MasonUpdate",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "luacheck", "rust_analyzer"
            },
        },
        dependencies = {
            "williamboman/mason.nvim",
            "saghen/blink.cmp",
        },
        config = function()
            require("mason-lspconfig").setup()
            local lspconfig = require("lspconfig")
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                -- Setup forked from nvim-lspconfig's docs
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if vim.loop.fs_stat(path .. "/.luarc.json")
                            or vim.loop.fs_stat(path .. "/.luarc.jsonc")
                            then return
                        end
                    end

                    client.config.settings.Lua =
                        vim.tbl_deep_extend(
                            "force",
                            client.config.settings.Lua,
                            {
                                runtime = {
                                    version = "LuaJIT",
                                },
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                        vim.env.VIMRUNTIME
                                    },
                                },
                            }
                        )
                end,
            })
            lspconfig.rust_analyzer.setup({})
        end
    },
}
