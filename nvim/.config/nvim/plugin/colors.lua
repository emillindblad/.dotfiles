require("gruvbox").setup({
    italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
    },
    invert_selection = false,
    contrast = "hard",
    transparent_mode = true,
    overrides = {
        SignColumn = {bg = ""},
        LineNr = {fg = "#83a598"},
        netrwDir = {fg = "#83a598"},
        TelescopeBorder = {fg = "#83a598"},
        qfFileName = {fg = "#aed75f"},
        NormalFloat = { bg = "#504945"},
    },
})

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
