-- configure treesitter
local parser_dir = vim.fn.stdpath("data") .. "/site"
vim.fn.mkdir(parser_dir, "p")
vim.opt.runtimepath:append(parser_dir)
vim.env.TREE_SITTER_DIR = parser_dir

-- Configure treesitter
require("nvim-treesitter").setup({
  -- Use the directory treesitter expects
  parser_install_dir = parser_dir,
  
  -- Disable auto-install
  auto_install = false,
  
  -- enable syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  
  -- enable indentation
  indent = { enable = false },
  
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
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

-- Force the parser directory after setup
local ts_install = require("nvim-treesitter.install")
ts_install.parser_install_dir = parser_dir

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
