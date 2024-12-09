-- Useful plugin to show you pending keybinds.
-- https://github.com/folke/which-key.nvim

return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    -- Document existing key chains
    spec = {
      { '<leader>b', group = 'Buffer' },
      { '<leader>f', group = 'Find' },
      { '<leader>g', group = 'Git', mode = { 'n', 'v' } },
      { '<leader>l', group = 'LSP/Code', mode = { 'n', 'v' } },
      { '<leader>q', group = 'Quit/Session' },
      { '<leader>s', group = 'Search' },
      { '<leader>t', group = 'Toggle' },
      {
        '<leader>w',
        group = 'Windows',
        proxy = '<c-w>',
        expand = function()
          return require('which-key.extras').expand.win()
        end,
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
