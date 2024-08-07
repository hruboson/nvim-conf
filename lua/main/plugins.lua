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
	{ -- better : commandline
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
	{ -- Markdown preview
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},
	{ -- multicursor
		"brenton-leighton/multiple-cursors.nvim",
		version = "*",  -- Use the latest tagged version
		opts = {},  -- This causes the plugin setup function to be called
		keys = {
			{"<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "x"}, desc = "Add cursor and move down"},
			{"<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "x"}, desc = "Add cursor and move up"},

			{"<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "i", "x"}, desc = "Add cursor and move up"},
			{"<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "i", "x"}, desc = "Add cursor and move down"},

			{"<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = {"n", "i"}, desc = "Add or remove cursor"},

			{"<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = {"n", "x"}, desc = "Add cursors to cword"},
			{"<Leader>A", "<Cmd>MultipleCursorsAddMatchesV<CR>", mode = {"n", "x"}, desc = "Add cursors to cword in previous area"},

			{"<Leader>d", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Add cursor and jump to next cword"},
			{"<Leader>D", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Jump to next cword"},

    		{"<Leader>l", "<Cmd>MultipleCursorsLock<CR>", mode = {"n", "x"}, desc = "Lock virtual cursors"},
		},
	},
	{ -- git conflict resolver
		'akinsho/git-conflict.nvim', 
		version = "*", 
		config = true
	},
})
