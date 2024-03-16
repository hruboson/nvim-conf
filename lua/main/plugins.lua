local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use { "wbthomason/packer.nvim" } -- Have packer manage itself
	use { "Mofiqul/dracula.nvim" } -- Dracula theme
	use { "folke/tokyonight.nvim" } -- Tokyonight theme
	use { "nvim-treesitter/nvim-treesitter" } -- syntax highlighting
	use { "windwp/nvim-autopairs" } -- Bracket autopairs
	use { "lukas-reineke/indent-blankline.nvim" } -- Leading lines for indentation (vs-code like)
	use { "akinsho/bufferline.nvim" } -- Bufferline (file tabs)
	use { "nvim-lualine/lualine.nvim" } -- Bottom statusline
	use { "rrethy/vim-illuminate" } -- Highlight the same keyword as under cursor
	use ({
		"folke/drop.nvim",
		event = "VimEnter",
		config = function()
			require("drop").setup({
				theme = "spring"
			})
		end,
	})
	use {
		'VonHeikemen/fine-cmdline.nvim',
		requires = {
		    {'MunifTanjim/nui.nvim'}
		}
	}
	use { "mbbill/undotree" } -- Undo history (git-like)

	use { "nvim-tree/nvim-tree.lua" } -- File tree window
	use { "nvim-tree/nvim-web-devicons" } -- Icons for nvim-tree and other plugins

	use { "nvim-telescope/telescope.nvim" } -- File explorer
	use { "nvim-lua/plenary.nvim" } -- Lua dependecy

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
