-- set init.vim (now vimrc.vim) file location and run commands (config) in it
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

-- include all config files
require "main.options"
require "main.dracula"
require "main.keymaps"
require "main.ntree_conf"
