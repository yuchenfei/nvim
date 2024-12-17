require('config.lazy')
require('config.keymaps')
require('config.autocmds')

-- [[ Colorscheme ]]
-- ttokyonight-day, tokyonight-moon, tokyonight-storm, okyonight-night
-- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
vim.cmd.colorscheme('catppuccin-mocha')
vim.cmd.hi('Comment gui=none')
