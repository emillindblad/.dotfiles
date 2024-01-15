local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

cmp.setup {
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
        hover = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),

    sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'ultisnips' }, -- For ultisnips users.
        { name = 'buffer', keyword_length = 3 },
    },

    snippet = {
        expand = function(args)
            -- For `luasnip` user.
            -- require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` user.
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },

    formatting = {
        format = lspkind.cmp_format {
            mode = "symbol_text",
            maxwidth = 35,
            ellipsis_char = '...',
            menu = {
                buffer = "[Buf]",
                nvim_lsp = "[LSP]",
                ultisnips = "[Snip]",
                latex_symbols = "[LaTeX]",
                path = "[Path]",
            },
        },
    },

    preselect = cmp.PreselectMode.None,
}
