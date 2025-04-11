return {
  { "rose-pine/neovim", name = "rose-pine", opts = {
    variant = "moon",
  } },
  { "rebelot/kanagawa.nvim" },
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup({
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
        bold_vert_split = false,
        disable_background = true,
        disable_float_background = true,
        disable_italics = true,
        dim_nc_background = true,
      })
    end,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = { "bold" },
          keywords = {},
          strings = {},
          variables = { "bold" },
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        transparent_background = true,
        integrations = {
          aerial = true,
          alpha = true,
          cmp = true,
          dashboard = true,
          flash = true,
          gitsigns = true,
          headlines = true,
          illuminate = true,
          indent_blankline = { enabled = true },
          leap = true,
          lsp_trouble = true,
          mason = true,
          markdown = true,
          mini = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          navic = { enabled = true, custom_bg = "lualine" },
          neotest = true,
          neotree = true,
          noice = true,
          semantic_tokens = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        },
      })
    end,
  }, -- and this
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "poimandres",
    },
  },
}
