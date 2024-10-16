-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
 return {
  {'wakatime/vim-wakatime', lazy = false },
  {"nelsyeung/twig.vim"},
  {
 "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({
 keymaps = {
    accept_suggestion = "<C-cr>",
    clear_suggestion = "<C-]>",
    accept_word = "<C-j>",
  },
      })
      end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
          filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true,
        }
      },
      window = {
        position = "right",
        width = 30,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["<space>"] = "none",
          ["l"] = "open",
        },
      },
    },
  },
 {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          })
        end,
      },
    },
    event = "BufReadPost",
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },

    init = function()
      vim.keymap.set("n", "zR", function()
        require("ufo").openAllFolds()
      end)
      vim.keymap.set("n", "zM", function()
        require("ufo").closeAllFolds()
      end)
    end,
  },
}
