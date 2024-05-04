return {
  { "rose-pine/neovim", name = "rose-pine", opts = {
    variant = "moon",
  } },
  -- {
  --   "shaunsingh/nord.nvim",
  -- },
  -- {
  --   "AlexvZyl/nordic.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("nordic").load()
  --   end,
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "base16-nord",
    },
  },
}
