local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

	use "catppuccin/nvim"

	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "saadparwaiz1/cmp_luasnip"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"

	use "L3MON4D3/LuaSnip"
	use "rafamadriz/friendly-snippets"

	use "neovim/nvim-lspconfig"
	use "jose-elias-alvarez/null-ls.nvim"
	use "MunifTanjim/prettier.nvim"
	use "MunifTanjim/eslint.nvim"

	use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

	use "tamago324/nlsp-settings.nvim"

	use "nvim-telescope/telescope.nvim"
	use 'nvim-telescope/telescope-media-files.nvim'

	use "akinsho/toggleterm.nvim"

	use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
	use "nvim-treesitter/playground"

	use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

	use "numToStr/Comment.nvim" -- Easily comment stuff
	use 'JoosepAlviste/nvim-ts-context-commentstring'

	use 'mfussenegger/nvim-dap'
	use { "leoluz/nvim-dap-go", requires = {"mfussenegger/nvim-dap"} }
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
	use 'theHamsta/nvim-dap-virtual-text'
	use 'nvim-telescope/telescope-dap.nvim'
	use "Pocco81/DAPInstall.nvim"

	-- Git
  use "lewis6991/gitsigns.nvim"

	use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

	use "ahmedkhalf/project.nvim"

	use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

	use 'neovim/nvim-lspconfig'
	use 'nvim-treesitter/nvim-treesitter'

	use 'ray-x/go.nvim'
	use 'ray-x/guihua.lua' -- recommended if need floating window support

	use 'folke/neodev.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
