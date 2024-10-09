-- vim.opt.clipboard = "unnamedplus" 	-- set os clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus") -- set os clipboard (first option doesn't work for some reason)
vim.opt.ignorecase = true
vim.opt.number = true					-- show line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
-- vim.o.statuscolumn = "%s %l %r "
vim.opt.mouse = "a"						-- set default mouse action
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.wrap = false					-- do not wrap long lines
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.fillchars = {eob = " "}			-- remove tildes on blanklines
vim.opt.mousemoveevent = true 			-- should allow tabs to hover but doesnt work for some reason ://
vim.opt.undofile = true	
--vim.cmd[[autocmd FileType * set formatoptions-=cro]] -- disable continuous comments on new line 
vim.opt.inccommand = "nosplit"

-- ufo.nvim
vim.opt.foldcolumn = '1' -- '0' is not bad
vim.opt.foldlevel = 20 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 20 
vim.opt.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:󰅀,foldsep: ,foldclose:]]
