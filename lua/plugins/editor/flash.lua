-- Navigate code with search labels, enhanced character motions
-- https://github.com/folke/flash.nvim

return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  keys = {
    { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
    { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
    { 'c', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
    { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
    { '<leader>ts', mode = { 'n' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
  },
  ---@module 'flash'
  ---@type Flash.Config
  opts = {
    labels = 'asdfghjklqwertyuiopzxcvbnm',
    label = {
      rainbow = {
        enabled = true,
      },
    },
    modes = {
      search = {
        enabled = false,
      },
    },
  },
}
