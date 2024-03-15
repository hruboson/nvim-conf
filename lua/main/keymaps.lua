vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', {noremap = true}) -- allow Ctrl+Backspace
-- Ctrl+Del is in vimrc file
vim.api.nvim_set_keymap("n", "<TAB>", "<C-^>", { noremap = true, silent = true, desc = "Alternate buffers" }) -- alternate between buffers in normal mode using tab 
