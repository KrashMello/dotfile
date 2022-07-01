let g:nvim_data_root = stdpath('data')
let g:nvim_config_root = stdpath('config')
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
"let g:prettier#quickfix_enabled = 0
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'
"let g:formatters_vue = ['eslint_local', 'stylelint']
"let g:run_all_formatters_vue = 1
let g:config_file_list = ['/nvimPlugins/plugins.vim',
    \ '/general/settings.vim',
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
"let g:foldmethod=indent  
"let g:foldnestmax=10
"let g:nofoldenable
"let g:foldlevel=2
let mapleader = " "
for f in g:config_file_list
    execute 'source ' . g:nvim_config_root . f
endfor
hi normal guibg=000000
nnoremap <leader>w :w<cr>
nnoremap <leader>wq :wq<cr>
silent! nmap <C-b> :NERDTreeToggle<CR>
nnoremap <c-z> :u<CR>
nnoremap <c-y> :redo<CR>
nnoremap <leader>q :q!<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
