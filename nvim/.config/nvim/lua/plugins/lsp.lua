return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'whoissethdaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = { notification = { window = { winblend = 0 } } } },
    'folke/neodev.nvim',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('<leader>gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        map('<leader>gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>re', require('telescope.builtin').lsp_references, '[R][e]ferences')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader><CR>', vim.lsp.buf.code_action, '[C]ode [A]ction')
        map('<leader>ds', vim.diagnostic.open_float, '[D]agnostic [S]how')
        map('<leader>dn', vim.diagnostic.goto_next, '[D]agnostic [N]ext')
        map('<leader>ti', function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { buf = event.buf })
        end, '[T]oggle [I]nlay hint')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local default_cmd = vim.fn.stdpath('data') .. '/mason/bin/'
    local servers = {
      bashls = {},
      clangd = {
        cmd = { default_cmd .. 'clangd', '--background-index', '--clang-tidy' },
      },
      emmet_ls = {
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
        init_options = {
          html = {
            options = {
              -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
              ['bem.enabled'] = true,
            },
          },
        },
      },
      eslint = {},
      gopls = {
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            staticcheck = true,
            analyses = {
              shadow = true,
              unusedparams = true,
            },
          },
        },
      },
      jdtls = {
        cmd = { 'jdtls' },
      },
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              library = {
                -- '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
            },
            completion = {
              callSnippet = 'Replace',
            },
            diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
      --[[ pylsp = {
        settings = {
          pylsp = {
            plugins = {
              autopep8 = { enabled = false },
              yapf = { enabled = false },
              ruff = { enabled = false },
              pyflakes = { enabled = false },
              pylint = { enabled = false },
              jedi_completion = { fuzzy = true },
              pycodestyle = {
                enabled = true,
                ignore = { 'W503', 'E121', 'E123', 'E3' },
                maxLineLength = 130,
              },
              -- pylint = {
              --   enabled = true,
              --   args = { '--disable-all --enable-basic,typecheck,refactoring,classes,variables,miscellaneous --disable-invalid-name' },
              -- },
              pylsp_mypy = {
                enabled = true,
              },
            },
          },
        },
      }, ]]
      pyright = {
        settings = {
          pyright = {
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- ignore = { '*' },
              autoSearchPaths = true,
              diagnosticMode = 'openFilesOnly',
            },
          },
        },
      },
      ruff = {},
      rust_analyzer = {},
      tailwindcss = {
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'rust' },
        init_options = {
          userLanguages = {
            rust = 'html',
          },
        },
      },
      texlab = {},
      tsserver = {},
    }

    require('mason').setup {
      ui = {
        border = 'rounded',
        height = 0.8,
      },
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format lua code
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('neodev').setup()
    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          -- TODO: Figure out how to extend cmd/just add flags
          if server_name == 'ruff' then
            server.capabilities.hoverProvider = false
          end
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }

    -- Update diagnostics in insert mode
    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      update_in_insert = true,
    })

    -- Use rounded borders for hover and signature help
    require('lspconfig.ui.windows').default_options.border = 'rounded'
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
    vim.diagnostic.config {
      float = { border = 'rounded' },
    }
  end,
}
