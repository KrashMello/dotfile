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
