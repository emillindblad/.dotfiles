require'nvim-treesitter.configs'.setup {
    ensure_installed = { "javascript", "typescript", "tsx", "python", "lua", "java", "bash", "vim", "rust", "c", "cpp", "go" },
    sync_install = false,
    auto_install = false,
    indent = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
