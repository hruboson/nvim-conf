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



	--------------------- THEMES ---------------------
	{ "Mofiqul/dracula.nvim" }, -- Dracula theme
	{ "folke/tokyonight.nvim" }, -- Tokyonight theme



	--------------------- CORE ---------------------
	{ -- file explorer
		"nvim-tree/nvim-tree.lua",
		version = "1.7.1",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{ -- cokeline (bufferline)
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim",        -- Required for v0.4.0+
			"nvim-tree/nvim-web-devicons", -- If you want devicons
			"stevearc/resession.nvim"       -- Optional, for persistent history
		},
		config = true
	},
	{ "nvim-treesitter/nvim-treesitter", version="0.9.2"}, -- syntax highlighting parser packager
	{ "windwp/nvim-autopairs" }, -- Bracket autopairs
	{ "lukas-reineke/indent-blankline.nvim" }, -- Leading lines for indentation
	{ "nvim-lualine/lualine.nvim" }, -- Bottom statusline
	{ -- clipboard manager
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{'nvim-telescope/telescope.nvim'},
		},
		config = function()
		  require('neoclip').setup()
		end,
	},



	--------------------- HANDY ---------------------
	{ "mbbill/undotree" }, -- Undo history (git-like)
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
	{ "dstein64/nvim-scrollview"}, -- scrollbar
	{ "mg979/vim-visual-multi" }, -- multicursor
	{ "LunarVim/bigfile.nvim" }, -- big files
	{ -- auto window layout
		"anuvyklack/windows.nvim",
		dependencies = { "anuvyklack/middleclass" },
	},
	{ "folke/twilight.nvim" }, -- focus mode
	{ "folke/zen-mode.nvim", opts = { } }, -- zen mode



	--------------------- PRETTY ---------------------
	{ -- dashboard on startup
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup {
				config = {
					header = true,
					week_header = {
						enable = true,  -- boolean use a week header
					},
				}
			}
		end,
	},
	{ "rrethy/vim-illuminate" }, -- Highlight the same keyword as under cursor
	{ "Djancyp/better-comments.nvim" }, -- Highlight comments based on rules
	{ "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } }, -- better folds
	{ -- yank animation
		"rachartier/tiny-glimmer.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration
		},
	},



	--------------------- MISCELLANEOUS ---------------------
	{ "andweeb/presence.nvim" }, -- Discord rich presence (doesn"t seem to work on Linux)
	{ "meznaric/key-analyzer.nvim", opts = {} }, -- find unused keys by :KeyAnalyzer <key>



	--------------------- CONFIG ---------------------
	{ "b0o/mapx.nvim" }, -- easy keybinds




	--------------------- IDE (AUTOCOMPLETE, LSP, ...) ---------------------
	{ "echasnovski/mini.completion", version = "*" }, -- autocomplete
	{ -- jupiter notebooks
		"kiyoon/jupynium.nvim",
		build = "pip3 install --user .",
		run="pip3 install --user jupynium",
		-- build = "conda run --no-capture-output -n jupynium pip install .",
		-- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
		dependencies = {
			"rcarriga/nvim-notify",   -- optional
			"stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
		},
	},



	--------------------- RETIRED ---------------------
	-- These are the plugins that didn't play well (either not compatible across operatin systems, broke something or had other problems)

	--  the better commandline was not playing well with substitution (:s//)
	--	{ -- better : commandline
	--		"VonHeikemen/fine-cmdline.nvim",
	--		dependencies = {
	--		    {"MunifTanjim/nui.nvim"}
	--		}
	--	},

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
	


})
