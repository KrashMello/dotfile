-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })
vim.keymap.set("i", "<C-h>", "<left>", { desc = "Go to left", remap = true })
vim.keymap.set("i", "<C-j>", "<down>", { desc = "Go to lower", remap = true })
vim.keymap.set("i", "<C-k>", "<up>", { desc = "Go to upper", remap = true })
vim.keymap.set("i", "<C-l>", "<right>", { desc = "Go to right", remap = true })

vim.keymap.set("n", "<c-z>", ":u<CR>", { desc = "Undo", remap = true })
vim.keymap.set("n", "<c-y>", ":redo<CR>", { desc = "redo", remap = true })
vim.keymap.set("i", "", "<C-o>:u<CR>", { desc = "Undo", remap = true })
vim.keymap.set("i", "<80>ü^DY", "<C-o>:redo<CR>", { desc = "redo", remap = true })

vim.keymap.set("n", "<C-a>", "ggVG", { desc = "select All", remap = true })

--terminal

vim.keymap.set("n", "<a-3>", function()
  Util.float_term()
end, { desc = "Terminal (cwd)" })
vim.keymap.set("t", "<A-3>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- save file
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
