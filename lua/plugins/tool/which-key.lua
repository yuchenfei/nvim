-- Useful plugin to show you pending keybinds.
-- https://github.com/folke/which-key.nvim

return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    -- Document existing key chains
    spec = {
      { '<leader>b', group = 'Buffer' },
      { '<leader>g', group = 'Git' },
      { '<leader>h', group = 'Git Hunk', mode = { 'n', 'v' } },
      { '<leader>l', group = 'LSP/Code' },
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
    icons = {
      group = '',
    },
  },
}
