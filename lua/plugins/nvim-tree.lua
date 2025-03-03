return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            filters = {
                -- Rember to escape backslashses with a backslash
                custom = { "^.*\\~$" },
            },
            renderer = {
                group_empty = true
            },
        })
    end,
}
