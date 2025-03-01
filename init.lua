-- set init.vim (now vimrc.vim) file location and run commands (config) in it
-- local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
-- vim.cmd.source(vimrc)
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

-- include all config files
require "main.plugins"
require "main.options"
require "main.theme"
require "main.keymaps"
require "main.autoload"	
-- require "main.lsp"
require "main.sftp"
require "main.commands"

-- plugin files
require "main.pconf_ntree"
require "main.pconf_treesitter"
require "main.pconf_cokeline"
require "nvim-treesitter.configs".setup { -- load treesitter
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
require "nvim-autopairs".setup { -- load autopairs
    check_ts = true,
}
require("ibl").setup({ -- load indent blankline
	debounce = 100,
	whitespace = { highlight = { "Whitespace", "NonText" } },
	exclude = { 
		filetypes = {
			"packer",
			"nvimtree",
			"dashboard",
			"help"
		},
		buftypes = {
			"terminal",
			"nofile",
			"quickfix"
		}
	}
})
require("telescope.builtin")
require("lualine").setup { -- load lualine
	options = {
    	icons_enabled = true,
	    theme = "nightfly",
	    component_separators = { left = "", right = ""},
	    section_separators = { left = "", right = ""},
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
require("illuminate").configure({ -- illuminate plugin config
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
        "lsp",
        "treesitter",
        "regex",
    },
    -- delay: delay in milliseconds
    delay = 0,
	filetypes_denylist = {
    	"dirvish",
        "fugitive",
		"nvimtree",
    },
})
require("better-comment").Setup()
require("mini.completion").setup()
require("ufo").setup()
require("windows").setup()



----------------------
-- NEOVIDE SETTINGS --
----------------------
-- I'm currently running neovide on Windows, it's a lot smoother and there are almost no problems with plugins (so far)

if vim.g.neovide then
	vim.opt.guifont = { "FiraCode Nerd Font Mono:h11:-liga"}
    vim.cmd("cd G:\\Projects\\")  -- Change to your projects directory
end
