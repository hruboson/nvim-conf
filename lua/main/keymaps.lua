require'mapx'.setup{ global = true }
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
inoremap("<C-Del>", "<C-o>\"_dw")	-- allow Ctrl+Del

-- NORMAL
nnoremap("<TAB>", ":bn<cr>") -- alternate between buffers in normal mode using tab 
nnoremap("<C-x>", ":NvimTreeToggle<cr>") -- open/close NvimTree
nnoremap(":", "<cmd>FineCmdline<CR>")
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
