require("nvim-lsp-installer").setup {}

local util = require 'lspconfig.util'

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
    })

local function config(_config)
    return vim.tbl_deep_extend("force", {
        --capabilities = require('cmp_nvim_lsp').default_capabilites(vim.lsp.protocol.make_client_capabilities())
    }, _config or {})
end

--Python
require('lspconfig').jedi_language_server.setup(config())

--LaTeX
require('lspconfig').texlab.setup(config())

-- C/C++
require'lspconfig'.clangd.setup(config({
    cmd = { "clangd", "--background-index", "--clang-tidy" },
    root_dir = function() return vim.loop.cwd() end
}))

--Javuh
--require'lspconfig'.java_language_server.setup(config({
    --cmd = {"/home/emil/github/etc/java-language-server/dist/lang_server_linux.sh"}
--}))
require'lspconfig'.jdtls.setup(config())

--SQL
require'lspconfig'.sqlls.setup(config({
    root_dir = util.root_pattern '.sqllsrc.json'
}))

--cssls
--Enable (broadcasting) snippet capability for completion
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true

--require'lspconfig'.cssls.setup {
  --capabilities = capabilities,
--}

--html
require'lspconfig'.html.setup {
  capabilities = capabilities,
  filetypes= {"html","htmldjango"}
}

--tsserver
require("lspconfig").tsserver.setup(config())

--tailwind
require'lspconfig'.tailwindcss.setup(config())

require'lspconfig'.emmet_ls.setup(config({
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
}))
