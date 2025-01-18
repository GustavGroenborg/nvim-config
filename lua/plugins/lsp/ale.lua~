return {
    "dense-analysis/ale",
    config = function()
        -- Configuration goes here.
        local g = vim.g

        -- Made as inline vimscript, due to lack of knowledge
        vim.cmd([[
            set completeopt=menu,menuone,popup,noselect,noinsert
        ]])

        g.ale_python_auto_virtualenv = 1
        g.ale_ruby_rubocop_auto_correct_all = 1

        g.ale_linters = {
            ruby = {"rubocop", "ruby"},
            lua = {"lua_language_server"}
        }
    end
}
