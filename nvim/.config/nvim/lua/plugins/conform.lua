return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = function(bufnr)
      -- Enable format on save for specified filetypes
      local enable_filetypes = {
        'lua',
      }
      if vim.tbl_contains(enable_filetypes, vim.bo[bufnr].filetype) then
        return {
          timeout_ms = 500,
          lsp_fallback = true,
        }
      end
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
    },
  },
}
