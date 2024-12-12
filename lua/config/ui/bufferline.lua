-- https://github.com/akinsho/bufferline.nvim
---@module 'bufferline'

return function()
  ---@type bufferline.Config
  ---@diagnostic disable: missing-fields
  ---@diagnostic disable: assign-type-mismatch
  local opts = {
    highlights = require('catppuccin.groups.integrations.bufferline').get(),
    options = {
        -- stylua: ignore
        close_command = function(n) Snacks.bufdelete(n) end,
        -- stylua: ignore
        right_mouse_command = function(n) Snacks.bufdelete(n) end,
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Neo-tree',
          highlight = 'Directory',
          text_align = 'left',
          separator = true,
        },
      },
    },
  }
  return opts
end