-- https://github.com/akinsho/bufferline.nvim

return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  keys = {
    { '<leader>bB', '<Cmd>BufferLinePick<CR>', desc = 'Pick a Buffer' },
    { '<leader>bC', '<Cmd>BufferLinePickClose<CR>', desc = 'Close a Buffer (Pick)' },
    { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
    { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Close Non-Pinned Buffers' },
    { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Close Buffers to the Right' },
    { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Close Buffers to the Left' },
    { '<leader>bs', '<Cmd>BufferLineSortByExtension<CR>', desc = 'Sort by Extension' },
    { '<leader>bS', '<Cmd>BufferLineSortByDirectory<CR>', desc = 'Sort by Directory' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Previous Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Previous Buffer' },
    { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '[B', '<cmd>BufferLineMovePrev<cr>', desc = 'Move Buffer Prev' },
    { ']B', '<cmd>BufferLineMoveNext<cr>', desc = 'Move Buffer Next' },
  },
  ---@module 'bufferline'
  ---@type bufferline.Config
  ---@diagnostic disable: assign-type-mismatch
  opts = {
    options = {
      close_command = function(n) Snacks.bufdelete(n) end,
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
  },
  config = function(_, opts)
    require('bufferline').setup(opts)
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete' }, {
      callback = function()
        vim.schedule(function() pcall(nvim_bufferline) end)
      end,
    })
  end,
}
