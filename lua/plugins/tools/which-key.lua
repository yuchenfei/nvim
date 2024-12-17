-- https://github.com/folke/which-key.nvim

return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  ---@module 'which-key'
  ---@type wk.Config
  opts = {
    -- Document existing key chains
    spec = {
      { '<leader>a', group = 'AI', mode = { 'n', 'v' } },
      { '<leader>f', group = 'Find' },
      { '<leader>g', group = 'Git', mode = { 'n', 'v' } },
      { '<leader>l', group = 'LSP/Code', mode = { 'n', 'v' } },
      { '<leader>p', group = 'Packages', icon = { icon = require('config.icons').ui.package } },
      { '<leader>q', group = 'Quit/Session' },
      { '<leader>s', group = 'Search' },
      { '<leader>t', group = 'Toggle' },
      { '<leader>x', group = 'Diagnostics' },
      {
        '<leader>b',
        group = 'Buffer',
        expand = function() return require('which-key.extras').expand.buf() end,
      },
      {
        '<leader>w',
        group = 'Windows',
        proxy = '<c-w>',
        expand = function() return require('which-key.extras').expand.win() end,
      },
      -- better descriptions
      { 'gx', desc = 'Open with system app' },
    },
    triggers = {
      { '<auto>', mode = 'nixsotc' },
    },
    sort = { 'order', 'group', 'alphanum', 'mod' },
    icons = {
      group = '',
    },
  },
}
