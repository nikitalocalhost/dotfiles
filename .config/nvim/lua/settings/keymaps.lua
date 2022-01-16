local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>ba", ":badd<CR>", {noremap = true})
keymap("n", "<leader>bd", ":bdel<CR>", {noremap = true})
keymap("n", "<leader>bj", ":bnext<CR>", {noremap = true})
keymap("n", "<leader>bk", ":bprevious<CR>", {noremap = true})
