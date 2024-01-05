-- Set keybinding in current LaTeX buffer
vim.keymap.set("n", "<F8>", vim.fn["vimtex#compiler#compile"], { desc =  "Compile LaTeX document", buffer = 0 })
