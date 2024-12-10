-- A blazing fast and easy to configure Neovim statusline written in Lua.
-- https://github.com/nvim-lualine/lualine.nvim
--
-- References:
-- - https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/ui.lua

return {
  'nvim-lualine/lualine.nvim',
  opts = function()
    local icons = require('config.icons')
    return {
      options = { component_separators = '' },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          'branch',
        },
        lualine_c = {
          {
            'diff',
            symbols = {
              added = icons.git.added .. ' ',
              removed = icons.git.deleted .. ' ',
              modified = icons.git.modified .. ' ',
            },
          },
          {
            'diagnostics',
            symbols = {
              error = icons.diagnostics.error .. ' ',
              warn = icons.diagnostics.warn .. ' ',
              info = icons.diagnostics.info .. ' ',
              hint = icons.diagnostics.hint .. ' ',
            },
          },
          { 'filetype', icon_only = true, padding = { left = 1, right = 0 } },
          { 'filename', file_status = false, path = 1, padding = { left = 0, right = 0 } },
        },
        lualine_x = {},
        lualine_y = { 'encoding', 'fileformat', 'filetype' },
        lualine_z = {
          { 'location', separator = ' ', padding = { left = 0, right = 0 } },
          { 'progress', padding = { left = 0, right = 1 } },
        },
      },
      extensions = { 'lazy', 'mason', 'neo-tree' },
    }
  end,
}
