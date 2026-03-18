-- List of language servers and where to install them! 

-- JS/TS: https://github.com/typescript-language-server/typescript-language-server
-- GOpls: go install golang.org/x/tools/gopls@latest
-- Python: pip install pylsp-rope

vim.lsp.config["nix"] = {
	-- Command and arguments to start the server.
	cmd = { "nil", "--stdio" },

	-- Filetypes to automatically attach to.
	filetypes = { "nix", "flake" },

	-- Sets the "root directory" to the parent directory of the file in the current buffer
	root_markers = { ".gitignore", "flake.nix", "flake.lock" },
	settings = {

	},
}

vim.lsp.config["js-ts"] = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "typescript", "js", "ts" },
	root_markers = { ".gitignore", ".package.json", ".gitattributes", ".tsconfig.json" },
	settings = {

	},
}

vim.lsp.config["gopls"] = {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" }, 
	root_markers = { ".git", ".gitignore", ".gitattributes", "go.mod" },
}

vim.lsp.config["pylsp"] = {
	cmd = { "pylsp" },
	filetypes = { "python", "py" }, 
	root_markers = { ".git", ".gitignore", ".gitattributes", "requirements.txt", "setup.py", "pyproject.toml" },
	settings = {
		pylsp = {
			plugins = {
				pyflakes = { enabled = true },
				pycodestyle = { enabled = true },
				autopep8 = { enabled = false },
				yapf = { enabled = false },
			},
		},
	},
}

vim.lsp.config["omnisharp"] = {
	cmd = { "OmniSharp", "-lsp", "--hostPID", tostring(vim.fn.getpid()) },
	filetypes = { "cs" },
	root_markers = { ".git", ".sln", ".csproj" },
}

vim.lsp.enable({"nix"})
vim.lsp.enable({"js-ts"})
vim.lsp.enable({"gopls"})
vim.lsp.enable({"pylsp"})
vim.lsp.enable({"omnisharp"})

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

if client.resolved_capabilities.document_highlight then
	vim.cmd [[
	hi! LspReferenceRead cterm=bold ctermbg=235 guibg=LightYellow
	hi! LspReferenceText cterm=bold ctermbg=235 guibg=LightYellow
	hi! LspReferenceWrite cterm=bold ctermbg=235 guibg=LightYellow
	]]
	vim.api.nvim_create_augroup('lsp_document_highlight', {})
	vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
		group = 'lsp_document_highlight',
		buffer = 0,
		callback = vim.lsp.buf.document_highlight,
	})
	vim.api.nvim_create_autocmd('CursorMoved', {
		group = 'lsp_document_highlight',
		buffer = 0,
		callback = vim.lsp.buf.clear_references,
	})
end
