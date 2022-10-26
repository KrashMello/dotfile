local keymap = vim.keymap

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

keymap.set('n', '<leader>w', ':w<cr>')
keymap.set('n', '<leader>wq', ':wq<cr>')
keymap.set('n', '<leader>e', ':NERDTreeToggle<cr>')
keymap.set('n', '<S-e>', ':NERDTree<cr>')
keymap.set('i', '', '<C-o>:u<cr>')
keymap.set('i', '<80>ü^DY', '<C-o>:redo<cr>')
keymap.set('n', '<C-z>', ':u<cr>')
keymap.set('n', '<C-y>', ':redo<cr>')
-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')
-- split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })
-- move windows
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 's<right>', '<C-w>l')

--commentary--

keymap.set('n', '<C-k><C-b>', ':Commentary<cr>')
keymap.set('v', '<C-k><C-b>', ":'<,'>Commentary<cr>")

keymap.set('n', '<leader>q', ':q!<cr>')
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files hidden=true<cr>')
keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
keymap.set('n', '<C-b>', '<cmd>Telescope file_browser<cr>')
keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
keymap.set('n', '<A-,>', ':BufferPrevious<cr>')
keymap.set('n', '<A-.>', ':BufferNext<cr>')
keymap.set('n', '<A-<>', ':BufferMovePrevious<cr>')
keymap.set('n', '<A->>', ':BufferMoveNext<cr>')
keymap.set('n', '<A-1>', ':BufferGoto 1<cr>')
keymap.set('n', '<A-2>', ':BufferGoto 2<cr>')
keymap.set('n', '<A-3>', ':BufferGoto 3<cr>')
keymap.set('n', '<A-4>', ':BufferGoto 4<cr>')
keymap.set('n', '<A-5>', ':BufferGoto 5<cr>')
keymap.set('n', '<A-6>', ':BufferGoto 6<cr>')
keymap.set('n', '<A-7>', ':BufferGoto 7<cr>')
keymap.set('n', '<A-8>', ':BufferGoto 8<cr>')
keymap.set('n', '<A-9>', ':BufferGoto 9<cr>')
keymap.set('n', '<A-w>', ':BufferClose<cr>')

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

keymap.set('i', '<up>', '<up>', opts)
keymap.set('i', '<down>', '<down>', opts)
-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keymap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion.
keymap.set("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
