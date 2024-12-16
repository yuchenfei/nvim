-- https://github.com/lewis6991/gitsigns.nvim

return function()
  ---@module 'gitsigns'
  ---@type Gitsigns.Config
  local opts = {
    signs = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
    current_line_blame = true,
    on_attach = require('config.keys').gitsigns,
  }
  return opts
end
