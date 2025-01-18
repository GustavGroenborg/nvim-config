return {
    "lervag/vimtex",
    init = function()
        local g = vim.g
        -- Preventing viewer from automatically opening after compilation
        g.vimtex_view_automatic=0

        -- Putting the output files in a director name "build"
        g.vimtex_compiler_latexmk = {
            outdir = "build/",
        }

        vim.api.nvim_create_autocmd('BufReadPre', {
            pattern = { '*' },
            callback = function()
                if os.getenv("MASTER_TEX") ~= "" then
                    vim.b.vimtex_main = os.getenv("MASTER_TEX")
                end
            end
        })

    end
}
