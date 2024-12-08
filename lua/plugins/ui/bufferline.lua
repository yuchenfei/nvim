-- A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.
-- https://github.com/akinsho/bufferline.nvim
--
-- References:
-- - https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/ui.lua

return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  dependencies = 'nvim-tree/nvim-web-devicons',
  keys = {
    { '<leader>bb', '<Cmd>BufferLinePick<CR>', desc = 'Pick Buffer' },
    { '<leader>bd', '<Cmd>BufferLinePickClose<CR>', desc = 'Close Buffer from Tabline' },
    { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
    { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Close Non-Pinned Buffers' },
    { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Close Buffers to the Right' },
    { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Close Buffers to the Left' },
    { '<leader>bE', '<Cmd>BufferLineSortByExtension<CR>', desc = 'Sort by Extension' },
    { '<leader>bD', '<Cmd>BufferLineSortByDirectory<CR>', desc = 'Sort by Directory' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '[B', '<cmd>BufferLineMovePrev<cr>', desc = 'Move buffer prev' },
    { ']B', '<cmd>BufferLineMoveNext<cr>', desc = 'Move buffer next' },
  },
  opts = function()
    return {
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
  end,
}
