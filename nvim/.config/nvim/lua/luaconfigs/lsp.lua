require("neodev").setup()
require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")
local servers = {
    pyright = {},
    texlab = {},
    clangd = {
        cmd = { "clangd --background-index --clang-tidy" }
    },
    jdtls = {},
    tsserver = {},
    tailwindcss = {},
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
        }
    },
    rust_analyzer = {},
    lua_ls = {
        Lua = {
            completion = {
                callSnipet = "Replace"
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = { enable = false, },
        },
    }
}

local on_attach = function(_, bufnr)
-- TODO: Add bindings for buffers with servers attached
end

local util = require('lspconfig.util')
-- Annouce capabilities to LSP servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Update diagnostics in insert mode
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
    }
)

-- Install servers
mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers)
}

-- Configure servers
mason_lspconfig.setup_handlers {
    function (server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
}

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
