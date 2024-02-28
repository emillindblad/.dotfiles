require("neodev").setup()
require("mason").setup({
    ui = {
        border = "rounded",
        height = 0.8,
    }
})
local mason_lspconfig = require("mason-lspconfig")
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
        cmd = { "clangd --background-index --clang-tidy" }
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
                    -- Make the server aware of Neovim runtime files
                    unpack(vim.api.nvim_get_runtime_file('', true)),
                    checkThirdParty = false,
                },
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

local on_attach = function(_, bufnr)
-- TODO: Add bindings for buffers with servers attached
end

local util = require('lspconfig.util')

-- Announce capabilities to LSP servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Update diagnostics in insert mode
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
    }
)


-- Configure servers
mason_lspconfig.setup_handlers {
    function (server_name)
        local server = servers[server_name] or {}
        require('lspconfig')[server_name].setup {
            cmd = server.cmd,
            settings = server.settings,
            filetypes = server.filetypes,
            init_options = server.init_options,
            capabilities = server.capabilities or capabilities,
            on_attach = on_attach,
        }
    end,
}

-- Use rounded borders for hover and signature help
require('lspconfig.ui.windows').default_options.border = 'rounded'

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {border = 'rounded'}
)

vim.diagnostic.config({
    float = {
        border = "rounded",
    }
})

-- Install servers
mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers)
}

--local lspconfig = require("lspconfig")
--lspconfig.gopls.setup({
  --settings = {
    --gopls = {
        --completeUnimported = true,
        --usePlaceholders = true,
        --staticcheck = true,
        --analyses = {
            --shadow = true,
            --unusedparams = true,
        --}
    --},
  --},
--})

-- TODO: Setup for remaining servers.
--Javuh
--local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
--local workspace_dir = '/home/emil/.local/share/nvim/lsp_servers/jdtls/bin/workspace/' .. project_name
--require'lspconfig'.jdtls.setup{
    --cmd = {
        --'java',
        --'-data', workspace_dir
    --},
--}

--SQL
--require'lspconfig'.sqlls.setup(config({
    --root_dir = util.root_pattern '.sqllsrc.json'
--}))

--cssls
--Enable (broadcasting) snippet capability for completion
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true

--require'lspconfig'.cssls.setup {
  --capabilities = capabilities,
--}
