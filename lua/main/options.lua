vim.opt.clipboard = "unnamedplus" 		-- set os clipboard
vim.api.nvim_set_option("clipboard", "unnamed")
vim.opt.ignorecase = true
vim.opt.number = true					-- show line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.o.statuscolumn = "%s %l %r "
vim.opt.mouse = "a"						-- set default mouse action
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.wrap = false					-- do not wrap long lines
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.mousemoveevent = true 			-- should allow tabs to hover but doesnt work for some reason ://
vim.cmd[[autocmd FileType * set formatoptions-=cro]] -- disable continuous comments on new line 

-- COQ settings
vim.g.coq_settings = {
  keymap = {
    recommended = false,
    jump_to_mark = '',
    pre_select = true,
  },
  auto_start = true,
  display = {
    pum = {
      fast_close = false
    }
  }
}
