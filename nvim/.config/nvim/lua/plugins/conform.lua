return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = function(bufnr)
      -- Enable format on save for specified filetypes
      local enable_filetypes = {
        'lua',
        'rust',
        'python',
        'go',
      }
      if vim.tbl_contains(enable_filetypes, vim.bo[bufnr].filetype) then
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_format' },
      -- go = { 'gopls' },
    },
  },
}
