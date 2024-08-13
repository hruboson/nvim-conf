--! This file is currently not used as I had some trouble getting the LSP to work properly across platforms

local lsp_zero = require('lsp-zero')

require("mason").setup()
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    --- lsp_zero.default_setup,

    --- replace `example_server` with the name of a language server 
    --- clangd = function()
      --- in this function you can setup
      --- the language server however you want. 
      --- in this example we just use lspconfig
  },})

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- LSP
-- lspconfig.pyright.setup{} -- Python
-- lspconfig.ccls.setup{} -- C\C++
