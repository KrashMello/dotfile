-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })
keymap.set("i", "<C-h>", "<left>", { desc = "Go to left", remap = true })
keymap.set("i", "<C-j>", "<down>", { desc = "Go to lower", remap = true })
keymap.set("i", "<C-k>", "<up>", { desc = "Go to upper", remap = true })
keymap.set("i", "<C-l>", "<right>", { desc = "Go to right", remap = true })

keymap.set("n", "<c-z>", ":u<CR>", { desc = "Undo", remap = true })
keymap.set("n", "<c-y>", ":redo<CR>", { desc = "redo", remap = true })
keymap.set("i", "", "<C-o>:u<CR>", { desc = "Undo", remap = true })
keymap.set("i", "<80>ü^DY", "<C-o>:redo<CR>", { desc = "redo", remap = true })

keymap.set("n", "<C-a>", "ggVG", { desc = "select All", remap = true })

--jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

--tabs
keymap.set("n", "<tab>", ":tabnext<CR>", opts)
keymap.set("n", "<S-tab>", ":tabprev<CR>", opts)
--terminal

keymap.set("n", "<a-3>", function()
  Util.float_term()
end, { desc = "Terminal (cwd)" })
keymap.set("t", "<A-3>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- save file
keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

--nvim specter
keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre",
})
keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word",
})
keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word",
})
keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})

-- atac API
keymap.set("n", "<leader>aa", ":Atac<CR>", { desc = "Atac" })
