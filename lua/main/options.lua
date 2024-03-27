vim.opt.clipboard = "unnamedplus" 		-- set os clipboard
vim.opt.ignorecase = true
vim.opt.number = true					-- show line numbers
vim.opt.mouse = "a"						-- set default mouse action
vim.opt.wrap = false					-- do not wrap long lines
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.mousemoveevent = true 			-- should allow tabs to hover but doesnt work for some reason ://
vim.opt_local.formatoptions:remove({ 'r', 'o' }) -- disable commenting out the next line after comment line

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
