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
	{ "nvim-treesitter/nvim-treesitter" }, -- syntax highlighting parser packager
	{ "windwp/nvim-autopairs" }, -- Bracket autopairs
	{ "lukas-reineke/indent-blankline.nvim" }, -- Leading lines for indentation
	{ -- cokeline (bufferline)
	  "willothy/nvim-cokeline",
	  dependencies = {
		"nvim-lua/plenary.nvim",        -- Required for v0.4.0+
		"nvim-tree/nvim-web-devicons", -- If you want devicons
		"stevearc/resession.nvim"       -- Optional, for persistent history
	  },
	  config = true
	},
	{ "nvim-lualine/lualine.nvim" }, -- Bottom statusline
	{ "rrethy/vim-illuminate" }, -- Highlight the same keyword as under cursor
	{ "andweeb/presence.nvim" }, -- Discord rich presence (doesn"t seem to work on Windows)
	{ "Djancyp/better-comments.nvim" },
	{ -- dashboard
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
--  the better commandline was not playing well with substitution (:s//)
--	{ -- better : commandline
--		"VonHeikemen/fine-cmdline.nvim",
--		dependencies = {
--		    {"MunifTanjim/nui.nvim"}
--		}
--	},
	{ "mbbill/undotree" }, -- Undo history (git-like)

	{
		"nvim-tree/nvim-tree.lua",
		version = "1.7.1",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	{ -- File explorer and much more
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim", -- undo history
        	"Snikimonkd/telescope-git-conflicts.nvim", -- git conflicts resolver
		},
		config = function()
			require("telescope").setup({
				-- the rest of your telescope config goes here
				extensions = {
					undo = { },
					conflicts = { },
				},
			})
			require("telescope").load_extension("undo")
			require("telescope").load_extension("conflicts")
		end,
	}, 
	{ -- clipboard manager
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{'nvim-telescope/telescope.nvim'},
		},
		config = function()
		  require('neoclip').setup()
		end,
	},

	{ "b0o/mapx.nvim" }, -- easy keybinds
	{ "dstein64/nvim-scrollview"}, -- scrollbar
	--{ -- Markdown preview
	--	"OXY2DEV/markview.nvim",
	--	lazy = false,      -- Recommended
	--	-- ft = "markdown" -- If you decide to lazy-load anyway
	--
	--	dependencies = {
	--		"nvim-treesitter/nvim-treesitter",
	--		"nvim-tree/nvim-web-devicons"
	--	}
	--},
	{ "mg979/vim-visual-multi" }, -- multicursor
	{ "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" }},
	{ "LunarVim/bigfile.nvim" },
    { "meznaric/key-analyzer.nvim", opts = {} }, -- find unused keys by :KeyAnalyzer <key>

	-- ----------------------------------
	-- IDE stuff (autocomplete, lsp, ...)
	-- ----------------------------------
	{ 'echasnovski/mini.completion', version = '*' }, -- autocomplete
})
