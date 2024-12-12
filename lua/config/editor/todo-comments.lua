-- https://github.com/folke/todo-comments.nvim
---@module 'todo-comments'

return function()
  local icons = require('config.icons')
  ---@type TodoConfig
  local opts = {
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
  return opts
end
