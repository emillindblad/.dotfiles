return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter-context',
      config = function()
        require('treesitter-context').setup {
          enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
          throttle = true, -- Throttles plugin updates (may improve performance)
          max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
          show_all_context = show_all_context,
          patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
            -- For all filetypes
            -- Note that setting an entry here replaces all other patterns for this entry.
            -- By setting the 'default' entry below, you can control which nodes you want to
            -- appear in the context window.
            default = { 'function', 'method', 'for', 'while', 'if', 'switch', 'case' },
            typescript = { 'class_declaration', 'abstract_class_declaration', 'else_clause' },
          },
          mode = 'cursor',
        }
      end,
    },
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'bash', 'lua', 'c', 'go', 'rust', 'python', 'lua', 'java', 'vim', 'vimdoc', 'tsx', 'typescript', 'javascript' },
      disable = { 'latex', 'bibtex', 'tex' },
      sync_install = false,
      auto_install = false,
      indent = { enable = true },
      incremental_selection = { enable = true },
      textobjects = { enable = true },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
  end,
}
