-- https://github.com/nvim-lualine/lualine.nvim

local M = {}

function M.lint_status()
  local linters = require('lint').get_running()
  if #linters == 0 then
    return '󰦕'
  end
  return '󱉶 ' .. table.concat(linters, ', ')
end

return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = {
    'AndreM222/copilot-lualine',
  },
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
        lualine_x = {
          { 'copilot', padding = { left = 0, right = 1 } },
          { M.lint_status, padding = { left = 0, right = 1 } },
        },
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
