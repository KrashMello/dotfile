set nocompatible
call plug#begin(stdpath('data').'/plugged')

    " NERDTree
    Plug 'preservim/nerdtree'

    " VIM-DEVICONS icons for NERDTree
    Plug 'ryanoasis/vim-devicons'

    " Conquer Of Completion
    Plug 'neoclide/coc.nvim', {'branch': 'master'}
    Plug 'neoclide/coc-eslint'
    Plug 'neoclide/coc-vetur'
    " sintax
    Plug 'sheerun/vim-polyglot'
    " typing
    Plug 'jiangmiao/auto-pairs'
    Plug 'alvan/vim-closetag'
    " Surround.vim
    Plug 'tpope/vim-surround'

    " Airline status bar
   " Plug 'vim-airline/vim-airline'
   " Plug 'vim-airline/vim-airline-themes'

    " NERDCommenter
    Plug 'preservim/nerdcommenter'
    
    " prettier
    Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
    
    " emmet
    Plug 'mattn/emmet-vim'
    " yourcompleteme
    Plug 'valloric/youcompleteme', {'do' : './install.py'}
    " auto tag
    Plug 'craigemery/vim-autotag'
    "auto formatter
    Plug 'chiel92/vim-autoformat'
    " indentline
    Plug 'yggdroot/indentline'
    
    " BarBar
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'romgrk/barbar.nvim'


    call plug#end()
