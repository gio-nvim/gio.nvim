local map = vim.keymap.set

map("i", "jj", "<esc>")
map("c", "jj", "<esc>")
map("t", "jj", "<C-\\><C-n>")

map("n", "<A-o>", "i<cr><esc>O")
