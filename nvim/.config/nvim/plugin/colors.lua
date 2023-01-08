require("gruvbox").setup({
    italic = false,
    invert_selection = false,
    contrast = "hard",
    transparent_mode = true,
    overrides = {
        SignColumn = {bg = ""},
        LineNr = {fg = "#83a598"},
        netrwDir = {fg = "#83a598"},
        TelescopeBorder = {fg = "#83a598"},
        qfFileName = {fg = "#aed75f"},
    },
})

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])