local cmd = vim.cmd
local g = vim.g
local opt = vim.opt
local keymap = vim.keymap

g.mapleader = " "

cmd [[
syntax enable
syntax on

set guicursor=                                     " Disable blinking for the n-v-c modes
set termguicolors
set guioptions-=T                                   " No Tool bar

set cursorline                                     " Highlight the current line

set hidden                                         " When on a buffer becomes hidden when it is abandoned
set path+=**
set nowrap
set encoding=UTF-8

set number relativenumber

set smartindent
set smarttab
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartcase
set incsearch
set nohlsearch
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=135
highlight ColorColumn ctermbg=0 guibg=lightgrey

set noswapfile
set nobackup
set undofile
let g:airline_theme='base16_dracula'
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
"let g:prettier#quickfix_enabled = 0
autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'
"let g:formatters_vue = ['eslint_local', 'stylelint']
"let g:run_all_formatters_vue = 1
let g:config_file_list = ['/nvimPlugins/plugins.vim',
    \ '/general/settings.vim',
    \ '/after/plugins/telescope.nvim.vim',
    \ ]
let g:vim_vue_plugin_config = { 
      \'syntax': {
      \   'template': ['html'],
      \   'script': ['javascript', 'typescript'],
      \   'style': ['css', 'scss', 'sass', 'less'],
      \   'i18n': ['json', 'yaml'],
      \   'route': 'json',
      \},
      \'full_syntax': ['json'],
      \'initial_indent': ['i18n', 'i18n.json', 'yaml'],
      \'attribute': 1,
      \'keyword': 1,
      \'foldexpr': 1,
      \'debug': 0,
      \}

]]

cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'ryanoasis/vim-devicons'
    use 'preservim/nerdtree'
    use {
            'prettier/vim-prettier',
            run = 'yarn install --frozen-lockfile --production', 
        }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        tag = 'v1.*',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
    use'thedenisnikulin/vim-cyberpunk'
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'shougo/deoplete.nvim'
    use 'valloric/youcompleteme'
    ---use 'zxqfl/tabnine-vim'
    use {'neoclide/coc.nvim', run = 'yarn install'} 
    use 'neoclide/coc-eslint'                                         
    use 'neoclide/coc-vetur'
    ---use 'neoclide/coc-tabnine'
    use 'sheerun/vim-polyglot'
    use 'jiangmiao/auto-pairs'
    use 'alvan/vim-closetag'
    use 'tpope/vim-surround'
    use 'preservim/nerdcommenter'
    use 'mattn/emmet-vim'
    use 'craigemery/vim-autotag'
    use 'chiel92/vim-autoformat'
    use 'yggdroot/indentline'
    use 'leafoftree/vim-vue-plugin'
    use 'kyazdani42/nvim-web-devicons'   
    use 'romgrk/barbar.nvim'
    use {'nvim-telescope/telescope-file-browser.nvim'}

  end
)

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
cmd[[
    colorscheme cyberpunk-neon
    ]]
require('telescope').setup{
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
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {
            'node_modules'
        },
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        path_display = {},
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker

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

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
require('lualine').get_config()

keymap.set('n','<leader>w',':w<cr>')
keymap.set('n','<leader>wq',':wq<cr>')
--keymap.set('n','<C-b>',':NERDTreeToggle<cr>')
--keymap.set('n','<S-e>',':NERDTree<cr>')
keymap.set('n','<C-z>',':u<cr>')
keymap.set('n','<C-y>',':redo<cr>')
keymap.set('n','<leader>q',':q!<cr>')
keymap.set('n','<leader>ff','<cmd>Telescope find_files hidden=true<cr>')
keymap.set('n','<leader>fg','<cmd>Telescope live_grep<cr>')
keymap.set('n','<leader>fb','<cmd>Telescope buffers<cr>')
keymap.set('n','<C-b>','<cmd>Telescope file_browser<cr>')
keymap.set('n','<leader>fh','<cmd>Telescope help_tags<cr>')
keymap.set('n','<A-,>',':BufferPrevious<cr>')
keymap.set('n','<A-.>',':BufferNext<cr>')
keymap.set('n','<A-<>',':BufferMovePrevious<cr>')
keymap.set('n','<A->>',':BufferMoveNext<cr>')
keymap.set('n','<A-1>',':BufferGoto 1<cr>')
keymap.set('n','<A-2>',':BufferGoto 2<cr>')
keymap.set('n','<A-3>',':BufferGoto 3<cr>')
keymap.set('n','<A-4>',':BufferGoto 4<cr>')
keymap.set('n','<A-5>',':BufferGoto 5<cr>')
keymap.set('n','<A-6>',':BufferGoto 6<cr>')
keymap.set('n','<A-7>',':BufferGoto 7<cr>')
keymap.set('n','<A-8>',':BufferGoto 8<cr>')
keymap.set('n','<A-9>',':BufferGoto 9<cr>')
keymap.set('n','<A-c>',':BufferClose<cr>')
