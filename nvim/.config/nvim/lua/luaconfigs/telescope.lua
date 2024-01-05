local telescope = require("telescope")
local telescopeConfig = require("telescope.config")
local actions = require("telescope.actions")

-- **File and text search in hidden files and directories:
-- **Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- **I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- **I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

telescope.setup({
    defaults = {
        -- **`hidden = true` is not supported in text grep commands.
        -- **Add new arguments
        vimgrep_arguments = vimgrep_arguments,

        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " > ",
        color_devicons = true,
        file_ignore_patterns = {".git/", "node_modules"},
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    },
    pickers = {
        find_files = {
            -- **`hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        buffers = {
            mappings = {
                i = {
                    ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
                }
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg"},
            find_cmd = "rg",
        }
    },
})

require("telescope").load_extension("fzy_native")
require("telescope").load_extension("media_files")

local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = " Dotfiles ",
        cwd = "$HOME/.dotfiles",
        hidden = true,
    })
end

return M
