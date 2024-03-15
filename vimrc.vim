call plug#begin('~/.local/share/nvim/stat/autoload/plugged') " Begin plugins section

Plug 'Mofiqul/dracula.nvim' " Dracula theme
Plug 'folke/tokyonight.nvim' " TokyoNight theme
Plug 'nvim-treesitter/nvim-treesitter' " syntax highlighting
Plug 'windwp/nvim-autopairs' " Bracket autopairs
Plug 'lukas-reineke/indent-blankline.nvim' " Leading lines for indentation (vs-code like)
Plug 'akinsho/bufferline.nvim', {'tag':'*'} " Buffeline (file tabs)
Plug 'anuvyklack/windows.nvim' " Windows manager plugin
Plug 'nvim-lualine/lualine.nvim' " Lualine - bottom statusline

Plug 'nvim-tree/nvim-tree.lua' " File tree window
Plug 'nvim-tree/nvim-web-devicons' " Icons for nvim-tree

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' } " Telescope
Plug 'nvim-lua/plenary.nvim' " Telescope dependency

call plug#end() " End plugins section

inoremap <C-Del> <C-o>dw
; " Find a way to move this to keymaps.lua (allows Ctrl+Del in insert mode)
