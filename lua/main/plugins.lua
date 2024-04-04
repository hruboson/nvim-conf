-- Load the Lazy.nvim plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

-- Install your plugins here
require("lazy").setup({ -- Enable Lazy
	{ "wbthomason/packer.nvim" }, -- Have packer manage itself
	{ "Mofiqul/dracula.nvim" }, -- Dracula theme
	{ "folke/tokyonight.nvim" }, -- Tokyonight theme
	{ "nvim-treesitter/nvim-treesitter" }, -- syntax highlighting
	{ "windwp/nvim-autopairs" }, -- Bracket autopairs
	{ "lukas-reineke/indent-blankline.nvim" }, -- Leading lines for indentation (vs-code like)
	{ "akinsho/bufferline.nvim" }, -- Bufferline (file tabs)
	{ "nvim-lualine/lualine.nvim" }, -- Bottom statusline
	{ "rrethy/vim-illuminate" }, -- Highlight the same keyword as under cursor
	{ "andweeb/presence.nvim" }, -- Discord rich presence (doesn"t seem to work on Windows)
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup {
				config = {
					header = true,
					week_header = {
						enable = true,  --boolean use a week header
					},
				}
			}
		end,
	},	
	{
		"VonHeikemen/fine-cmdline.nvim",
		dependencies = {
		    {"MunifTanjim/nui.nvim"}
		}
	},
	{ "mbbill/undotree" }, -- Undo history (git-like)

	{ "nvim-tree/nvim-tree.lua" }, -- File tree window
	{ "nvim-tree/nvim-web-devicons" }, -- Icons for nvim-tree and other plugins

	{ "nvim-telescope/telescope.nvim" }, -- File explorer
	{ "nvim-lua/plenary.nvim" }, -- Lua dependecy

	{ "ms-jpq/coq_nvim", branch = "coq" }, -- Autocompletion and other LSP stuff
	{ "ms-jpq/coq.artifacts", branch = "artifacts" }, -- Code snippets for coq
	{ "ms-jpq/coq.thirdparty", branch = "3p" }, -- Other stuff for coq

	{
	"williamboman/mason.nvim", -- LSP manager
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig", -- Neovim official LSP support plugin
	},
	
	-- LSP zero --
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	-- {'neovim/nvim-lspconfig'},
	-- {'hrsh7th/cmp-nvim-lsp'},
	-- {'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	--
	
	{'b0o/mapx.nvim'}, -- easy keybinds
	{'dstein64/nvim-scrollview'}, -- scrollbar
	-- install without yarn or npm
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	}
})
