require'mapx'.setup{ global = true }
nnoremap("<SPACE>", "<Nop>")
vim.g.mapleader = " " -- space as leader key

-- Modes
-- 		NORMAL = "n"
-- 		INSERT = "i"
-- 		VISUAL = "v"
-- 		VISUAL BLOCK = "x"
-- 		TERM = "t"
-- 		COMMAND = "c"
-- Help
-- 		For commands it is necessary to also specify to "run" the command with <cr> (Enter)

-- INSERT
inoremap("<C-H>", "<C-W>") -- allow Ctrl+Backspace
inoremap("<c-bs>", "<C-W>") -- allow Ctrl+Backspace in Neovide
inoremap("<C-Del>", "<C-o>\"_dw")	-- allow Ctrl+Del

-- NORMAL
nnoremap("<TAB>", ":bn<cr>") -- alternate between buffers in normal mode using tab 
nnoremap("<S-Tab>", ":bp<cr>") -- alternate to previous
nnoremap("<C-x>", ":NvimTreeToggle<cr>") -- open/close NvimTree
-- nnoremap(":", "<cmd>FineCmdline<CR>")
nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
nnoremap("<leader>rme",":%s/\r//g<CR>") -- remove ^M from end of line, carriage return problem
-- nnoremap("<C-s>", ":scp % xhrub01@merlin.fit.vutbr.cz:/homes/eva/xh/xhrubo01")

-- Telescope
nnoremap("<leader>tf", "<cmd>Telescope find_files<CR>")
nnoremap("<leader>tg", "<cmd>Telescope live_grep<CR>")
nnoremap("<leader>tb", "<cmd>Telescope buffers<CR>")
nnoremap("<leader>to", "<cmd>Telescope oldfiles<CR>")
nnoremap("<leader>ts", "<cmd>Telescope grep_string<CR>")
nnoremap("<leader>tu", "<cmd>Telescope undo<CR>")
nnoremap("<leader>tc", "<cmd>Telescope conflicts<CR>")
nnoremap("<leader>tp", "<cmd>Telescope neoclip plus<CR>")

-- Switch between projects with Telescope
vim.keymap.set("n", "<leader>pp", function()
    -- Open project switcher (Telescope projects)
    require("telescope").extensions.projects.projects()

    -- After selecting a project, change NvimTree directory
    local cwd = vim.fn.getcwd()  -- Get the current directory (project root)
    require('nvim-tree.api').tree.change_root(cwd)  -- Change NvimTree root to new project directory
end, { desc = "Switch between projects" })

-- remap all delete actions to void delete (do not copy to clipboard)
nnoremap("d", "\"_d")
nnoremap("dd", "\"_dd")
nnoremap("D", "\"_D")
nnoremap("x", "\"_x")
nnoremap("X", "\"_X")
nnoremap("s", "\"_s")
nnoremap("S", "\"_S")
nnoremap("gx", "\"_gx")
nnoremap("qf", "<cmd>lua vim.lsp.buf.code_action()<CR>")
nnoremap("U", "<C-r>")
nnoremap("<Esc>", "<cmd>noh<CR>")

-- VISUAL BLOCK
-- remap all delete actions to void delete
xnoremap("d", "\"_d")
xnoremap("dd", "\"_dd")
xnoremap("D", "\"_D")
xnoremap("x", "\"_x")
xnoremap("X", "\"_X")
xnoremap("s", "\"_s")
xnoremap("S", "\"_S")
xnoremap("gx", "\"_gx")
xnoremap("p", "P")

-- VISUAL
vnoremap("<TAB>", ">gv") -- add multiple tabs to selection in visual mode
vnoremap("U", "<C-r>")

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- Cokeline (buffer line) mappings
vim.keymap.set('n', '<leader>q', function()
	local lazy = require 'cokeline.lazy'
	local state = lazy 'cokeline.state'
	local curbufnumber = tonumber(vim.fn.bufnr '%')

	local target_buffer = require('cokeline.buffers').get_current()
	if not target_buffer then
		print 'Current buffer not found'
		return
	end

	target_buffer:delete()
end, { desc = 'close buffer' })

-- Windows.nvim
local function cmd(command)
	return table.concat({ '<Cmd>', command, '<CR>' })
end
vim.keymap.set('n', '<C-w>m', cmd 'WindowsMaximize')
vim.keymap.set('n', '<C-w>_', cmd 'WindowsMaximizeVertically')
vim.keymap.set('n', '<C-w>|', cmd 'WindowsMaximizeHorizontally')
vim.keymap.set('n', '<C-w>=', cmd 'WindowsEqualize')

vim.keymap.set("n", "<leader>ff", function() -- lsp formatter
	vim.lsp.buf.format({ async = true })
end, { desc = "LSP Format" })
vim.keymap.set("n", "=", "=", { noremap = true }) -- indentexpr formatter
