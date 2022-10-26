local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

require('base')
require('highlights')
require('map')
require('plugins')

require('rose-pine').setup({
  -- @usage 'main' | 'moon'
  dark_variant = 'moon',
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = true,
  disable_float_background = false,
  disable_italics = false,
  --- @usage string hex value or named color from rosepinetheme.com/palette
  groups = {
    background = 'base',
    panel = 'surface',
    border = 'highlight_med',
    comment = 'muted',
    link = 'iris',
    punctuation = 'subtle',

    error = 'love',
    hint = 'iris',
    info = 'foam',
    warn = 'gold',

    headings = {
      h1 = 'iris',
      h2 = 'foam',
      h3 = 'rose',
      h4 = 'gold',
      h5 = 'pine',
      h6 = 'foam',
    }
    -- or set all headings at once
    -- headings = 'subtle'
  },

  -- Change specific vim highlight groups
  highlight_groups = {
    ColorColumn = { bg = 'rose' }
  }
})

-- set colorscheme after options
--vim.cmd('colorscheme rose-pine')
--set termguicolors
--colorscheme cyberpunk
cmd [[
    colorscheme nord
    ]]
require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter = require 'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {
      'node_modules'
    },
    generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker

  },
  pickers = {
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },

  }
}
require("telescope").load_extension "file_browser"


