return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(
        opts.routes,
        { filter = { event = "notify", find = "No information available" }, opts = { skip = true } }
      )
      opts.routes =
        { { filter = { event = "notify", find = "Request textDocument/inlayHint failed" }, opts = { skip = true } } }
      opts.presets.lsp_doc_border = true
    end,
  },
  { "rcarriga/nvim-notify", opts = { render = "compact", background_colour = "#000000", timeout = 1000 } },
  {
    "b0o/incline.nvim",
    dependencies = {},
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local helpers = require("incline.helpers")
      require("incline").setup({
        window = { padding = 0, margin = { horizontal = 0 } },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          local buffer = {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            " ",
            guibg = "#363944",
          }
          return buffer
        end,
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    key = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-l>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
      { "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = { options = { mode = "tabs", show_buffer_close_icons = false, show_close_icon = false } },
  },
  {
    "kdheepak/lazygit.nvim",
    keys = { { ";c", ":LazyGit<Return>", silent = true, noremap = true } },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
               
               
               ▒▓▓▓                 ▓▓▓▒               
               ▒▓▓▓                 ▓▓▓▒               
               ▒▓▓▓                 ▓▓▓▒               
               ▒▓▓▓    ▓▓▓▓ ▓▓▓▓    ▓▓▓▒               
               ▒▓▓▓  ▓▓▓▓     ▓▓▓▓  ▓▓▓▒               
               ▒▓▓▓▓▓▓▓         ▓▓▓▓▓▓▓▒               
               ▒▓▓▓▓▓░           ░▓▓▓▓▓▒               
               ▒▓▓▓▓               ▓▓▓▓▒               
               ▓▓▓▓▓▓             ▓▓▓▓▓▒               
               ▓▓▓▓▓▓▓           ▓▓▓▓▓▓▒               
               ▓▓▓▓▓▓▓▓         ▓▓▓▒▓▓▓▒               
               ▓▓▓▓░ ▓▓▓       ▓▓▓ ░▓▓▓▒               
               ▓▓▓▓   ▓▓▓     ▓▓▓   ▓▓▓▒               
               ░░░░    ▓▓▓   ▓▓▓    ░░░░               
               ░░░░    ░▓▓▒ ▒▓▓░    ░░░░               
               ░░░░     ▓▓▓ ▓▓▓     ░░░░               
               ░░░░      ▓▓▓▓▓      ░░░░               
               ░░░░       ▓▓▓       ░░░░               
               ░░░░                 ░░░░               
               ░░░░                 ░░░░               
      ]],
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
}
