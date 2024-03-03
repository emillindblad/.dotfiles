return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'whoissethdaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = { notification = { window = { winblend = 0 } } } },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- TODO: Look into using telescope for some of these
        map('<leader>gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        map('<leader>gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        map('<leader>re', vim.lsp.buf.references, '[R]f[E]rences')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[N]ame')
        map('<leader>vh', vim.lsp.buf.hover, '[V]im [H]over')
        map('<leader><cr>', vim.lsp.buf.code_action, '[C]ode [A]ction')
        map('<leader>ds', vim.diagnostic.open_float, '[D]agnostic [S]how')
        map('<leader>dn', vim.diagnostic.goto_next, '[D]agnostic [N]ext')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- Find references for the word under your cursor.
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

        -- Opens a popup that displays documentation about the word under your cursor
        --  See `:help K` for why this keymap
        map('K', vim.lsp.buf.hover, 'Hover Documentation')

      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                enabled = true,
                ignore = {'W503', 'E121', 'E123', 'E3'},
                maxLineLength = 130
              },
              pylint = {
                enabled = true,
                args = {'--disable-all --enable-basic,typecheck,refactoring,classes,variables,miscellaneous --disable-invalid-name'}
              }
            },

          },
        },
      },
      texlab = {},
      clangd = {
        -- cmd = { "clangd --background-index --clang-tidy" },
      },
      jdtls = {
        cmd = { "jdtls" },
        filetypes = { "java" },
      },
      tsserver = {},
      tailwindcss = {
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'rust' },
        init_options = {
          userLanguages = {
            rust = "html",
          },
        },
      },
      eslint = {},
      emmet_ls = {
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
        init_options = {
          html = {
            options = {
              -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
              ["bem.enabled"] = true,
            },
          },
          --userLanguages = {
          --rust = 'html'
          --}
        }
      },
      rust_analyzer = {},
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              library = {
                unpack(vim.api.nvim_get_runtime_file('', true)),
              }
            },
            completion = {
              callSnippet = 'Replace',
            },
            diagnostics = { disable = { 'missing-fields' } },
            telemetry = { enable = false, },
          },
        },
      },
      gopls = {
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            staticcheck = true,
            analyses = {
              shadow = true,
              unusedparams = true,
            }
          },
        },
      },
    }

    require('mason').setup {
      ui = {
        border = 'rounded',
        height = 0.8,
      }
    }



    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format lua code
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          require('lspconfig')[server_name].setup {
            -- TODO: Figure out how to extend cmd/ just add flags
            cmd = server.cmd,
            settings = server.settings,
            filetypes = server.filetypes,
            init_options = server.init_options,
            capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {}),
          }
        end,
      },
    }

    -- Update diagnostics in insert mode
    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
      })

    -- Use rounded borders for hover and signature help
    require('lspconfig.ui.windows').default_options.border = 'rounded'
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
      vim.lsp.handlers.hover,
      { border = 'rounded' }
    )
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
      vim.lsp.handlers.signature_help,
      { border = 'rounded' }
    )
    vim.diagnostic.config({
      float = { border = 'rounded' }
    })
  end,
}
