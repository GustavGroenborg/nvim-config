local style_group = vim.api.nvim_create_augroup("stylesettings", { clear = true })
local file_patterns = { "cpp", "java", "lua", "markdown", "rust", "tex" }

-- Helper functions
local function setup_filetype_width(file_pattern, augroup)
    vim.api.nvim_create_autocmd(
        { "FileType" },
        {
            pattern = file_pattern,
            group   = augroup,
            command = "setlocal textwidth=80",
        }
    )
end

local function setup_filetype_spell(file_pattern, augroup)
    vim.api.nvim_create_autocmd(
        { "FileType" },
        {
            pattern = file_pattern,
            group   = augroup,
            command  = "setlocal spell spelllang=en_gb",
        }
    )
end


-- Basic setup
for _, file_pattern in ipairs(file_patterns) do
    setup_filetype_width(file_pattern, style_group)
    setup_filetype_spell(file_pattern, style_group)
end

-- Setting syntax for omz themes
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    {
        pattern = "*.zsh-theme",
        group   = style_group,
        command = "set syntax=zsh",
    }
)
