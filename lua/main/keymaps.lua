require'mapx'.setup{ global = true }

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
inoremap("<C-Del>", "<C-o>dw")	-- allow Ctrl+Del

-- NORMAL
nnoremap("<TAB>", "<C-^>") -- alternate between buffers in normal mode using tab 
nnoremap("<C-x>", ":NvimTreeToggle<cr>") -- open/close NvimTree
nnoremap(":", "<cmd>FineCmdline<CR>")
nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
nnoremap("<C-s>", ":scp % xhrub01@merlin.fit.vutbr.cz:/homes/eva/xh/xhrubo01")
nnoremap("d", "\"_d")
nnoremap("dd", "\"_dd")
nnoremap("x", "\"_x")