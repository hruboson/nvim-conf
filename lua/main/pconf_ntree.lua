-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set commandline root to open file
vim.g.nvim_tree_respect_buf_cwd = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
--require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
		folders_first = true,
	},
	view = {
		width = 30,
		preserve_window_proportions = true,
		cursorline = false,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
	auto_reload_on_write = true,
})

require'nvim-web-devicons'.setup {}

