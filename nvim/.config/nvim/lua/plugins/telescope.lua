return {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    { 'nvim-telescope/telescope-media-files.nvim' },
  },
  config = function()
    local actions = require('telescope.actions')
    require('telescope').setup {
      defaults = {
        -- **`hidden = true` is not supported in text grep commands.
        -- **Add new arguments
        --vimgrep_arguments = vimgrep_arguments,

        --file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' > ',
        color_devicons = true,
        file_ignore_patterns = { '.git/', 'node_modules' },
        --file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        --grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      },
      pickers = {
        find_files = {
          -- **`hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
          find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
        },
        buffers = {
          mappings = {
            i = {
              ['<c-d>'] = actions.delete_buffer + actions.move_to_top,
            },
          },
        },
      },
      extensions = {
        media_files = {
          filetypes = { 'png', 'webp', 'jpg', 'jpeg' },
          find_cmd = 'rg',
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'media_files')

    -- See `:help telescope.builtin`
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Search git repo' })
    vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = '[P]roject [B]uffers' })
    -- TODO: Fix arguments for these
    vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>pw', builtin.grep_string, { desc = '[S]earch current [W]ord' })

    vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[P]roject [F]iles' })
    vim.keymap.set('n', '<leader>dl', builtin.diagnostics, { desc = '[D]iagnostic [L]ist' })
    vim.keymap.set('n', '<leader>ht', builtin.help_tags, { desc = '[H]elp [T]ags' })
    vim.keymap.set('n', '<leader>tt', builtin.builtin, { desc = '[T]elsescope [T]elsescope' })
    vim.keymap.set('n', '<leader>vrc', function() -- Search dotfiles
      builtin.find_files {
        prompt_title = ' Dotfiles ',
        cwd = '$HOME/.dotfiles',
        hidden = true,
      }
    end, { desc = '[V]im [RC]' })

    -- Also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    --[[ vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' }) ]]
  end,
}
