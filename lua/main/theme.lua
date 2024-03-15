-- local dracula = require("dracula")
-- dracula.setup({
  -- customize dracula color palette
--  colors = {
--    bg = "#141523",
--    fg = "#F8F8F2",
--    selection = "#44475A",
--    comment = "#7F848E",
--    red = "#FF5555",
--    orange = "#9A86FD",
--    yellow = "#EAC394",
--    green = "#50fa7b",
--    purple = "#FF6BCB",
--    cyan = "#20E3B2",
--    pink = "#FF79C6",
--    bright_red = "#FF6E6E",
--    bright_green = "#69FF94",
--    bright_yellow = "#FFFFA5",
--    bright_blue = "#D6ACFF",
--    bright_magenta = "#FF92DF",
--    bright_cyan = "#A4FFFF",
--    bright_white = "#FFFFFF",
--    menu = "#21222C",
--    visual = "#3E4452",
--    gutter_fg = "#4B5263",
--    nontext = "#3B4048",
--    white = "#F8F8E5",
--    black = "#191A21",
--  },
  -- show the '~' characters after the end of buffers
--  show_end_of_buffer = true, -- default false
  -- use transparent background
--  transparent_bg = true, -- default false
  -- set custom lualine background color
--  lualine_bg_color = "#44475a", -- default nil
  -- set italic comment
--  italic_comment = true, -- default false
  -- overrides the default highlights with table see `:h synIDattr`
--  overrides = {},
  -- You can use overrides as table like this
  -- overrides = {
  --   NonText = { fg = "white" }, -- set NonText fg to white
  --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
  --   Nothing = {} -- clear highlight of Nothing
  -- },
  -- Or you can also use it like a function to get color from theme
  -- overrides = function (colors)
  --   return {
  --     NonText = { fg = colors.white }, -- set NonText fg to white of theme
  --   }
  -- end,
-- })

vim.cmd[[set termguicolors]]
-- vim.cmd[[set background=dark]]
-- vim.cmd[[colorscheme dracula]]

-- TokyoNight theme
require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})

vim.cmd[[colorscheme tokyonight]]
