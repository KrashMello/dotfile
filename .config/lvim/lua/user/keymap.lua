local kind = require("user.kind")
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>w"] = ":w<cr>"
lvim.keys.normal_mode["<leader>q"] = ":q!<cr>"
lvim.keys.normal_mode["<leader>wq"] = ":wq<cr>"
lvim.keys.normal_mode["<C-z>"] = ":u<CR>"
lvim.keys.normal_mode["<C-y>"] = ":redo<CR>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["bC"] = ":BufferLineGroupClose ungrouped<CR>"
lvim.keys.normal_mode["bl"] = ":BufferLineCloseRight<CR>"
lvim.keys.normal_mode["bh"] = ":BufferLineCloseLeft<CR>"
lvim.keys.normal_mode["fw"] = ":lua require('telescope.builtin').live_grep()<cr>"
lvim.keys.normal_mode["fb"] = ":lua require('telescope.builtin').buffers()<cr>"
lvim.keys.normal_mode["<C-f>"] = "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>"
lvim.keys.normal_mode["<C-A-f>"] = "<cmd>lua require('spectre').open_visual({select_word=true})<CR>"
lvim.keys.normal_mode["<C-a>"] = "ggVG"
lvim.keys.normal_mode["<C-r>"] = "<cmd>lua require('spectre').toggle()<CR>"

lvim.keys.insert_mode["<left>"] = "<left>"
lvim.keys.insert_mode["<right>"] = "<right>"
lvim.keys.insert_mode["<up>"] = "<up>"
lvim.keys.insert_mode["<down>"] = "<down>"
lvim.keys.insert_mode[""] = "<C-o>:u<CR>"
lvim.keys.insert_mode["<80>ü^DY"] = "<C-o>:redo<CR>"
lvim.keys.insert_mode["<C-h>"] = "<C-w>h"
lvim.keys.insert_mode["<C-l>"] = "<C-w>l"
lvim.keys.insert_mode["<C-j>"] = "<C-w>j"
lvim.keys.insert_mode["<C-k>"] = "<C-w>k"
lvim.keys.insert_mode["<C-h>"] = "<left>"
lvim.keys.insert_mode["<C-l>"] = "<right>"
lvim.keys.insert_mode["<C-j>"] = "<down>"
lvim.keys.insert_mode["<C-k>"] = "<up>"


lvim.lsp.buffer_mappings.normal_mode["gr"] = {
  ":lua require'telescope.builtin'.lsp_references()<cr>",
  kind.cmp_kind.Reference .. "Find References"
}

lvim.lsp.buffer_mappings.normal_mode["gd"] = {
  ":lua require'telescope.builtin'.lsp_definitions()<cr>",
  kind.cmp_kind.Reference .. "definitions"
}
lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
