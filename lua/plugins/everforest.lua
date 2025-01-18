return {
  "sainnhe/everforest",
  lazy = false,
  priority = 1000,
  config = function()
    local g = vim.g
    -- Dark version
    vim.opt.background = "dark"

    -- Setting the contrast
    g.everforest_background = "soft"

    -- Better performance
    g.everforest_better_performance = true

    -- Enabling italics
    g.everforest_enable_italic = true

    -- Setting the colour scheme to Everforest
    vim.cmd.colorscheme("everforest")

    vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = { 'everforest' },
        callback = function() 
            vim.cmd("hi SpellBad cterm=reverse")
        end,
    })

  end
}
