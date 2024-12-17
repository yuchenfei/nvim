-- highlight todo, notes, etc in comments
-- https://github.com/folke/todo-comments.nvim

return {
  'folke/todo-comments.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { ']t', function() require('todo-comments').jump_next() end, desc = 'Next Todo Comment' },
    { '[t', function() require('todo-comments').jump_prev() end, desc = 'Previous Todo Comment' },
    { '<leader>st', '<Cmd>TodoTelescope<CR>', desc = 'Search Todos' },
  },
  opts = function()
    local icons = require('config.icons')
    ---@module 'todo-comments'
    ---@type TodoOptions
    return {
      signs = true,
      keywords = {
        -- FIX:
        FIX = { icon = icons.todo.bug, color = 'error', alt = { 'BUG', 'FIXIT', 'FIXME', 'ISSUE' } },
        -- WARN:
        WARN = { icon = icons.todo.warn, color = 'warning', alt = { 'WARNING' } },
        -- HACK:
        HACK = { icon = icons.todo.hack, color = 'warning' },
        -- NOTE:
        NOTE = { icon = icons.todo.info, color = 'hint', alt = { 'INFO' } },
        -- TODO:
        TODO = { icon = icons.todo.todo, color = 'info' },
        -- PERF:
        PERF = { icon = icons.todo.perf, alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
        -- TEST:
        TEST = { icon = icons.todo.test, color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
      },
    }
  end,
}
