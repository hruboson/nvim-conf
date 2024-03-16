local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap -- shortcut function

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
keymap("i", "<C-H>", "<C-W>", opts) -- allow Ctrl+Backspace
keymap("i", "<C-Del>", "<C-o>dw", opts)	-- allow Ctrl+Del

-- NORMAL
keymap("n", "<TAB>", "<C-^>", opts) -- alternate between buffers in normal mode using tab 
keymap("n", "<C-x>", ":NvimTreeToggle<cr>", opts) -- open/close NvimTree
keymap("n", ":", "<cmd>FineCmdline<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
