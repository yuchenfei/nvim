-- https://github.com/HiPhish/rainbow-delimiters.nvim
-- TODO: Diable on big files

return function()
  ---@module 'rainbow-delimiters'
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
