return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    { -- TODO: Migrate from ultisnips
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'onsails/lspkind.nvim',
    'roobert/tailwindcss-colorizer-cmp.nvim',
  },
  config = function()
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local tw_colorizer = require('tailwindcss-colorizer-cmp')

    local luasnip = require('luasnip')
    luasnip.config.setup {
      history = true,
      enable_autosnippets = true,
      update_events = 'TextChanged,TextChangedI',
    }
    require('luasnip.loaders.from_lua').lazy_load { paths = { vim.fn.stdpath('config') .. '/LuaSnip' } }

    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    cmp.setup {
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
        hover = cmp.config.window.bordered(),
      },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
        { name = 'buffer', keyword_length = 3 },
        { name = 'path' },
      },

      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm { select = true },

        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
      },

      formatting = {
        format = function(entry, vim_item)
          local kind = lspkind.cmp_format {
            mode = 'symbol_text',
            maxwidth = 35,
            ellipsis_char = '...',
            menu = {
              buffer = '[Buf]',
              nvim_lsp = '[LSP]',
              ultisnips = '[Snip]',
              latex_symbols = '[LaTeX]',
              path = '[Path]',
            },
          }(entry, vim_item)
          tw_colorizer.setup { color_square_width = 2 }
          tw_colorizer.formatter(entry, vim_item)
          return kind
        end,
      },

      -- Fixes gopls preselecting non 1st item
      preselect = cmp.PreselectMode.None,
    }
  end,
}
