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
	{ -- Vague theme
		"vague-theme/vague.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other plugins
	},



	--------------------- CORE ---------------------
	{ -- file explorer
		"nvim-tree/nvim-tree.lua",
		--version = "1.7.1",
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
	{ "nvim-treesitter/nvim-treesitter" }, -- syntax highlighting parser packager
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

	{
		"luukvbaal/statuscol.nvim",
		config = function()
			require("statuscol").setup({
				relculright = false,
				segments = {
					{
						-- folds
						text = { require("statuscol.builtin").foldfunc },
						click = "v:lua.ScFa",
					},
					{
						-- diagnostics
						sign = { namespace = { "diagnostic/signs" }, maxwidth = 2, auto = true },
						click = "v:lua.ScSa",
					},
					{
						-- line numbers
						text = { require("statuscol.builtin").lnumfunc },
						condition = { true, require("statuscol.builtin").not_empty },
						click = "v:lua.ScLa",
					},
				},
			})
		end,
	},
	{ -- floating lsp diagnostics
		'dgagn/diagflow.nvim',
		opts = {
			format = function(diagnostic)
				return '[LSP] ' .. diagnostic.message
			end,
			scope = "line",
			show_borders = true,
		}
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
				defaults = {
					file_ignore_patterns = {
						"lib/.*",
						"lib\\.*", -- screw windows...
						"node_modules/.*",
						"node_modules\\.*",
						".git/.*",
						".git\\.*",
					},
				},
				extensions = {
					undo = { },
					conflicts = { },
					projects = { },
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
	{ -- lazygit
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
		}
	},
	{ "folke/twilight.nvim" }, -- focus mode
	{ "folke/zen-mode.nvim", opts = { } }, -- zen mode
	{
		"numToStr/Comment.nvim",
		opts = {
			padding = true,
			sticky = true,
			opleader = {
				line = "<leader>c",
				block = "<leader>cb",
			}
		}
	},
	{
		"esmuellert/vscode-diff.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		cmd = "CodeDiff",
		config = function()
			require("vscode-diff").setup({
				-- Highlight configuration
				highlights = {
					-- Line-level: accepts highlight group names or hex colors (e.g., "#2ea043")
					line_insert = "DiffAdd",      -- Line-level insertions
					line_delete = "DiffDelete",   -- Line-level deletions

					-- Character-level: accepts highlight group names or hex colors
					-- If specified, these override char_brightness calculation
					char_insert = nil,            -- Character-level insertions (nil = auto-derive)
					char_delete = nil,            -- Character-level deletions (nil = auto-derive)

					-- Brightness multiplier (only used when char_insert/char_delete are nil)
					-- nil = auto-detect based on background (1.4 for dark, 0.92 for light)
					char_brightness = nil,        -- Auto-adjust based on your colorscheme
				},

				-- Diff view behavior
				diff = {
					disable_inlay_hints = true,         -- Disable inlay hints in diff windows for cleaner view
					max_computation_time_ms = 5000,     -- Maximum time for diff computation (VSCode default)
				},

				-- Keymaps in diff view
				keymaps = {
					view = {
						quit = "q",                    -- Close diff tab
						toggle_explorer = "<leader>b",  -- Toggle explorer visibility (explorer mode only)
						next_hunk = "]c",   -- Jump to next change
						prev_hunk = "[c",   -- Jump to previous change
						next_file = "]f",   -- Next file in explorer mode
						prev_file = "[f",   -- Previous file in explorer mode
					},
					explorer = {
						select = "<CR>",    -- Open diff for selected file
						hover = "K",        -- Show file diff preview
						refresh = "R",      -- Refresh git status
					},
				},
			})
		end,
	},



	--------------------- PRETTY ---------------------
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = { "nvim-telescope/telescope.nvim", "ahmedkhalf/project.nvim" },
		config = function()
			local db = require("dashboard")
			require("project_nvim").setup {
				manual_mode = false, -- Automatically detect projects
				detection_methods = { "pattern" }, -- Detects projects based on patterns
				patterns = { ".git", "Makefile", "package.json" }, -- What counts as a "project"
			}
			require("telescope").load_extension("projects") -- Enable "projects" in Telescope

			db.setup({
				theme = "doom",
				config = {
					header = true,
					week_header = {
						enable = true,
					},
					center = { -- Define only shortcuts, no projects or files
						{ icon = "📁 ", desc = "Projects", key = "P", action = "Telescope projects" },
						{ icon = "🔍 ", desc = "Find File", key = "f", action = "Telescope find_files" },
						{ icon = "📝 ", desc = "New File", key = "n", action = "ene | startinsert" },
						{ icon = "⚙️  ", desc = "Config", key = "c", action = "edit $MYVIMRC" },
						{ icon = "❌ ", desc = "Quit", key = "q", action = "qa" },
					},
					vertical_center = true, -- Center the Dashboard on the vertical (from top to bottom)
					footer = { "🚀 Neovim loaded successfully!" }, -- Footer message
				},
			})
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
	{ -- code context bar
		"nvim-treesitter/nvim-treesitter-context" 
	},



	--------------------- MISCELLANEOUS ---------------------
	{
		"vyfor/cord.nvim",
		build = ":Cord update",
		-- opts = {}
	},
	{ "meznaric/key-analyzer.nvim", opts = {} }, -- find unused keys by :KeyAnalyzer <key>
	{ "nvzone/volt", enabled = (vim.g.neovide) }, -- library for some plugins below (WORKS ONLY WITH NEOVIDE ON WINDOWS)
	{
		"nvzone/typr",
		dependencies = "nvzone/volt",
		opts = {},
		cmd = { "Typr", "TyprStats" },
		enabled = (vim.g.neovide),
	},
	{ -- binary viewer and editor 
		'RaafatTurki/hex.nvim' ,
		config = function(_, opts)
			require("hex").setup()
		end
	},



	--------------------- IDE (AUTOCOMPLETE, LSP, ...) ---------------------
	{ "echasnovski/mini.completion", version = "*" }, -- autocomplete
	{ -- signature helper
		"Dan7h3x/signup.nvim",
		branch = "main",
		opts = {
			-- Your configuration options here
		},
		config = function(_,opts)
			require("signup").setup(opts)
		end
	},
	{
		"Cpoing/microscope.nvim",
		cmd = "MicroscopePeek",
		keys = {
			{ "<leader>ld", ":MicroscopePeek<CR>", desc = "Peek definition" },
		},
		config = function()
			require("microscope")
		end,
	},



	--------------------- CONFIG ---------------------
	{ "b0o/mapx.nvim" }, -- easy keybinds



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
