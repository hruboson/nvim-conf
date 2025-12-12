-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set commandline root to open file
vim.g.nvim_tree_respect_buf_cwd = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
--require("nvim-tree").setup()

-- my setup
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
		custom = { "node_modules", ".venv", "__pycache__" }
	},
	--git = {
	--   ignore = false,  -- show files ignored by git
    --},
	auto_reload_on_write = true,

	on_attach = function(bufnr)
		local api = require("nvim-tree.api")

		-- Default mappings
		api.config.mappings.default_on_attach(bufnr)

		-- =====================
		-- Rebind change-root
		-- =====================
		vim.keymap.del("n", "C", { buffer = bufnr })  -- remove default
		vim.keymap.set(
			"n",
			"<leader>cc",
			api.tree.change_root_to_node,
			{ desc = "Change NvimTree root", buffer = bufnr, noremap = true, silent = true }
		)

		-- =====================
		-- Multi-move extension
		-- =====================
		local marked_files = {}

		local function toggle_mark()
			local node = api.tree.get_node_under_cursor()
			if not node or node.type ~= "file" then return end

			if marked_files[node.absolute_path] then
				marked_files[node.absolute_path] = nil
				vim.notify("Unmarked: " .. node.name)
			else
				marked_files[node.absolute_path] = true
				vim.notify("Marked: " .. node.name)
			end

		end

		local function move_marked()
			local node = api.tree.get_node_under_cursor()
			if not node or node.type ~= "directory" then
				vim.notify("Cursor must be on a folder!", vim.log.levels.ERROR)
				return
			end

			local target_dir = node.absolute_path
			for path, _ in pairs(marked_files) do
				local filename = vim.fn.fnamemodify(path, ":t")
				local new_path = target_dir .. "/" .. filename
				vim.fn.rename(path, new_path)
				vim.notify("Moved " .. filename .. " → " .. target_dir)
			end

			marked_files = {}
			api.tree.reload()
		end

		-- custom tree keymaps
		local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }
		vim.keymap.set("n", "mm", toggle_mark, vim.tbl_extend("force", opts, { desc = "Mark/unmark file for move" }))
		vim.keymap.set("n", "mM", move_marked, vim.tbl_extend("force", opts, { desc = "Move marked files here" }))
	end,
})
