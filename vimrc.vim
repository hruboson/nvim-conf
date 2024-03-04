call plug#begin('~/.local/share/nvim/stat/autoload/plugged') " Begin plugins section

Plug 'Mofiqul/dracula.nvim' " Dracula theme
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " syntax highlighting
Plug 'nvim-tree/nvim-web-devicons' " Icons for nvim-tree
Plug 'nvim-tree/nvim-tree.lua'

call plug#end() " End plugins section

inoremap <C-Del> <C-o>dw
; " Find a way to move this to keymaps.lua (allows Ctrl+Del in insert mode)