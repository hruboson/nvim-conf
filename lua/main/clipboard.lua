vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		if vim.fn.executable("wl-copy") == 1 then
			vim.g.clipboard = {
				name = "wl-clipboard",
				copy = {
					["+"] = { "wl-copy", "--foreground", "--type", "text/plain" },
					["*"] = { "wl-copy", "--foreground", "--primary", "--type", "text/plain" },
				},
				paste = {
					["+"] = { "wl-paste", "--no-newline" },
					["*"] = { "wl-paste", "--no-newline", "--primary" },
				},
			}
			vim.opt.clipboard = "unnamedplus"
		end
	end,
})
