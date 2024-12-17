-- https://github.com/HiPhish/rainbow-delimiters.nvim
-- TODO: Diable on big files

return {
  'HiPhish/rainbow-delimiters.nvim',
  event = 'VeryLazy',
  main = 'rainbow-delimiters.setup',
  ---@module 'rainbow-delimiters'
  ---@type rainbow_delimiters.config
  opts = {
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
  },
}
