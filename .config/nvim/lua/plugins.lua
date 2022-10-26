local status, packer = pcall(require, 'packer')
if (not status) then
  print('packer is not installed')
  return
end

vim.cmd [[packadd packer.nvim]]
packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'ryanoasis/vim-devicons'
  use 'preservim/nerdtree'
  use 'xuyuanp/nerdtree-git-plugin'
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
  use 'thedenisnikulin/vim-cyberpunk'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'arcticicestudio/nord-vim'
  use 'shougo/deoplete.nvim'
  use 'valloric/youcompleteme'
  ---use 'zxqfl/tabnine-vim'
  use { 'neoclide/coc.nvim', run = 'yarn install' }
  use 'neoclide/coc-eslint'
  use 'neoclide/coc-vetur'
  use 'neoclide/coc-tabnine'
  use 'sheerun/vim-polyglot'
  use 'jiangmiao/auto-pairs'
  use 'townk/vim-autoclose'
  use 'tpope/vim-surround'
  use 'mattn/emmet-vim'
  use 'tpope/vim-commentary'
  use 'craigemery/vim-autotag'
  use 'chiel92/vim-autoformat'
  use 'yggdroot/indentline'
  use 'leafOfTree/vim-vue-plugin'
  use 'kyazdani42/nvim-web-devicons'
  use 'romgrk/barbar.nvim'
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  -- use 'neovim/nvim-lspconfig' -- LSP
end
)
