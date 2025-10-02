local treesitter = require('nvim-treesitter')
local configs = require('nvim-treesitter.configs')

configs.setup {
    ensure_installed = { "c", "cpp", "rust", "go", "ocaml", "javascript", "typescript", "html", "css", "json", "lua", "zig", "elixir", "erlang", "eex", "heex" },
    sync_install = false,
    auto_install = true,
    highlight = { 
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
