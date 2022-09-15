require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " > ",
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
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
		prompt_title = " Dot files ",
		cwd = "$HOME/.dotfiles",
		hidden = true,
	})
end

return M
