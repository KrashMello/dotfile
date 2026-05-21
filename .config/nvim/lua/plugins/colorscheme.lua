local theme_file_path = vim.fn.expand("$CONFIG_QTILE/config.json")
local uv = vim.uv

local function read_file(path)
  local file = io.open(path, "r")
  if not file then
    return "nord"
  end
  local content = vim.fn.json_decode(file:read("*line"))
  file:close()
  return content.theme
end

-- local function set_dark_mode()
--   vim.api.nvim_set_option_value("background", "dark", {})
--   vim.cmd([[colorscheme tokyonight-moon]])
-- end
--
-- local function set_light_mode()
--   vim.api.nvim_set_option_value("background", "light", {})
--   vim.cmd([[colorscheme onedark]])
-- end

local function watch_theme_change()
  local handle = uv.new_fs_event()

  local unwatch_cb = function()
    if handle then
      uv.fs_event_stop(handle)
    end
  end

  local event_cb = function(err)
    if err then
      error("Theme file watcher failed")
      unwatch_cb()
    else
      -- Important to wrap in schedule, otherwise error E5560
      vim.schedule(function()
        local theme = read_file(theme_file_path)
        vim.api.nvim_set_option_value("background", "dark", {})
        if theme == "nord" then
          vim.cmd([[colorscheme nord]])
        elseif theme == "catppuccin-mocha" then
          vim.cmd([[colorscheme catppuccin-mocha]])
        elseif theme == "rose-pine-dawn" then
          vim.api.nvim_set_option_value("background", "light", {})
          vim.cmd([[colorscheme rose-pine-dawn]])
        else
          vim.cmd([[colorscheme nord]])
        end
        unwatch_cb()
        watch_theme_change()
      end)
    end
  end

  local flags = {
    watch_entry = false, -- true = when dir, watch dir inode, not dir content
    stat = false, -- true = don't use inotify/kqueue but periodic check, not implemented
    recursive = false, -- true = watch dirs inside dirs
  }

  -- attach handler
  if handle then
    uv.fs_event_start(handle, theme_file_path, flags, event_cb)
  end

  return handle
end

local theme = read_file(theme_file_path)
watch_theme_change()

return {
  { "rose-pine/neovim", name = "rose-pine", opts = {
    variant = "moon",
  } },
  { "rebelot/kanagawa.nvim" },
  {
    "krashmello/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup({
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
        bold_vert_split = true,
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
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
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
  { "nordtheme/vim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = theme,
    },
  },
}
