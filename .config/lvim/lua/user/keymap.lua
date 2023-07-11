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
