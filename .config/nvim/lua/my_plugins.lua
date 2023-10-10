vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'dracula/vim'
  use 'editorconfig/editorconfig-vim'
  use 'mattn/emmet-vim'
  use 'preservim/nerdcommenter'
  use 'alvan/vim-closetag'
  use 'tpope/vim-endwise'
  use 'tpope/vim-surround'
  use 'lyokha/vim-xkbswitch'
  use 'jreybert/vimagit'
  use 'slim-template/vim-slim'
  use 'nvim-tree/nvim-web-devicons'

  use {
    'TimUntersberger/neogit',
    requires = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
      "ibhagwan/fzf-lua",              -- optional
    }
  }

--[[  use {]]
    --[["chrishrb/gx.nvim",]]
    --[[event = { "BufEnter" },]]
    --[[requires = { "nvim-lua/plenary.nvim" },]]
    --[[config = function() require("gx").setup {]]
    --[[} end,]]
  --[[}]]

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'smartpde/telescope-recent-files'

  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer' -- Autocomplete from buffer
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use "rafamadriz/friendly-snippets" -- Useful snippets

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }

  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }

  use 'jiangmiao/auto-pairs'
  use 'windwp/nvim-ts-autotag'

  use 'godlygeek/tabular'
  use 'terryma/vim-expand-region'
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use 'farmergreg/vim-lastplace'
  use 'terryma/vim-multiple-cursors'
  use 'tpope/vim-repeat'
  use 'maxbrunsfeld/vim-yankstack'

  use 'chr4/nginx.vim'
  use 'rust-lang/rust.vim'
  use 'pangloss/vim-javascript'
  use 'maxmellon/vim-jsx-pretty'
  use 'groenewege/vim-less'
  use 'plasticboy/vim-markdown'
  use 'vim-ruby/vim-ruby'
  use 'neovimhaskell/haskell-vim'
  use 'hashivim/vim-terraform'

  use 'vim-test/vim-test'

  -- image previewer
  use {'edluffy/hologram.nvim'}
end)
