require 'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    indent = {
        enable = true
    },
    highlight = {
        enable = true,    -- false will disable the whole extension
    },
}
