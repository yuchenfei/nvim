-- https://github.com/HiPhish/rainbow-delimiters.nvim
---@module 'rainbow-delimiters'
-- TODO: Diable on big files

return function()
  ---@type rainbow_delimiters.config
  local opts = {
    query = {
      [''] = 'rainbow-delimiters',
    },
    highlight = {
      'RainbowDelimiterRed',
      'RainbowDelimiterOrange',
      'RainbowDelimiterYellow',
      'RainbowDelimiterGreen',
      'RainbowDelimiterBlue',
      'RainbowDelimiterCyan',
      'RainbowDelimiterViolet',
    },
  }
  return opts
end
