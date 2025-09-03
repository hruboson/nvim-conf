-- List of language servers and where to install them
-- JS/TS: https://github.com/typescript-language-server/typescript-language-server
-- GOpls: go install golang.org/x/tools/gopls@latest

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

vim.lsp.config["gopls"] = {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" }, 
	root_markers = { ".gitignore", ".package.json", ".gitattributes" },
}

vim.lsp.enable({"js-ts"})
vim.lsp.enable({"gopls"})

-- Diagnostics
vim.diagnostic.config({
	virtual_text = {
		format = function(diagnostic)
			local msg = diagnostic.message
			local severity_map = {
				[vim.diagnostic.severity.ERROR] = "Error",
				[vim.diagnostic.severity.WARN]  = "Warning",
				[vim.diagnostic.severity.INFO]  = "Info",
				[vim.diagnostic.severity.HINT]  = "Hint",
			}

			local severity_label = severity_map[diagnostic.severity] or "Other"

			-- Show full message if short
			if #msg < 50 then
				return string.format("%s: %s", severity_label, msg)
			end

			-- Otherwise just show severity
			return severity_label
		end,
	},
	signs = true,          -- keep the sign column
	underline = true,      -- underline problematic code
	update_in_insert = false,
	severity_sort = true,
})
