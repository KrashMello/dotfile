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

-- peepsight
keymap.set("n", "<leader>t", ":Twilight<CR>", { desc = "twilight toggle" })
--terminal

keymap.set("n", "<a-3>", function()
  Util.terminal.open()
end, { desc = "Terminal (cwd)" })
keymap.set("t", "<A-3>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- atac API
-- keymap.set("n", "<leader>aa", ":Atac<CR>", { desc = "Atac" })

-- clear buffer
keymap.set("n", "<leader>bq", '<Esc>:%bdelete|edit #|normal`"<Return>', { desc = "Clear buffer" })

-- Redefine Ctrl+s to save with the custom function
vim.api.nvim_set_keymap("n", "<C-s>", ":lua SaveFile()<CR>", { noremap = true, silent = true })

-- Custom save function
function SaveFile()
  -- Check if a buffer with a file is open
  if vim.fn.empty(vim.fn.expand("%:t")) == 1 then
    vim.notify("No file to save", vim.log.levels.WARN)
    return
  end

  local filename = vim.fn.expand("%:t") -- Get only the filename
  local success, err = pcall(function()
    vim.cmd("silent! write") -- Try to save the file without showing the default message
  end)

  if success then
    vim.notify(filename .. " Saved!") -- Show only the custom message if successful
  else
    vim.notify("Error: " .. err, vim.log.levels.ERROR) -- Show the error message if it fails
  end
end
