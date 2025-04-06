-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
	enable = true,
	additional_vim_regex_highlighting = true,
  },
  -- enable indentation
  indent = { enable = false },
  
  -- ensure these language parsers are installed
  -- ensure_installed = { this shit doesnt work on windows and is super slow on startup
--	"c",
--	"cpp",
--	"python",
--	"json",
--	"javascript",
--	"html",
--	"css",
--	"markdown",
--	"markdown_inline",
--	"bash",
--	"lua",
--	"vim"
--  },

	playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
})

-- set specific highlighting
vim.api.nvim_set_hl(0, "@type", { link = "Keyword" })

-- set specific parser for filetypes
vim.filetype.add({
	extension = {
		jison = "jison",
		jisonlex = "jisonlex",
	}
})
vim.treesitter.language.register("javascript", "jison")
vim.treesitter.language.register("javascript", "jisonlex")
