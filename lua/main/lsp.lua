-- List of language servers and where to install them
-- JS/TS: https://github.com/typescript-language-server/typescript-language-server

vim.lsp.config["js-ts"] = {
	-- Command and arguments to start the server.
	cmd = { "typescript-language-server", "--stdio" },

	-- Filetypes to automatically attach to.
	filetypes = { "javascript", "typescript", "js", "ts" },

	-- Sets the "root directory" to the parent directory of the file in the
	-- current buffer that contains either a ".luarc.json" or a
	-- ".luarc.jsonc" file. Files that share a root directory will reuse
	-- the connection to the same LSP server.
	root_markers = { ".gitignore", ".package.json", ".gitattributes", ".tsconfig.json" },
	settings = {

	},
}

vim.lsp.enable({"js-ts"})
