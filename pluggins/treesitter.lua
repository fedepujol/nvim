require 'nvim-treesitter.install'.compilers = { "clang" }

require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash", "c", "cpp", "css", "html", "java", "javascript", "php", "lua", "python", "scss", "yaml"
    },    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    indent = {
        enable = true
    },
    highlight = {
        enable = true,                  -- false will disable the whole extension
    },
}
