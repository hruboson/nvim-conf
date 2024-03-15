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
require("lualine").setup { -- load lualine
	options = {
    	icons_enabled = true,
	    theme = 'nightfly',
	    component_separators = { left = '', right = ''},
	    section_separators = { left = '', right = ''},
	    disabled_filetypes = {
	    statusline = {},
    	winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
	refresh = {
	    statusline = 1000,
	    tabline = 1000,
    	winbar = 1000,
    }
  },
}
require('illuminate').configure({ -- illuminate plugin config
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    -- delay: delay in milliseconds
    delay = 0,
})
require('mini.starter').setup() 
