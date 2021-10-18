local g = vim.g
local set = vim.opt

g.mapleader = " "

vim.api.nvim_set_keymap("n", "<Space>", "<Nop>", {noremap = true})

require("settings.keymaps")

set.tabstop = 4
set.shiftwidth = 0

set.clipboard[#set.clipboard + 1] = "xsel"

require("settings.ui")
