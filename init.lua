-- set init.vim (now vimrc.vim) file location and run commands (config) in it
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

-- include all config files
require "main.options"
require "main.theme"
require "main.keymaps"
require "main.autoload"

-- plugin files
require "main.pconf_ntree"
require "main.pconf_treesitter"
require "nvim-treesitter.configs".setup { -- load treesitter
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
require "nvim-autopairs".setup { -- load autopairs
    check_ts = true,
}
require("ibl").setup()
require("telescope.builtin")
local bufferline = require("bufferline") -- load bufferline
bufferline.setup {
	options = {
		always_show_bufferline = true,
		hover = {
			enabled = true,
			delay = 200,
			reveal = {'close'}
        },
	}
}
local class = require "middleclass" -- load middleclass file for windows.nvim
require("windows").setup() -- load windows plugin
