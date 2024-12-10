-- Fuzzy Finder (files, lsp, etc)
--
-- - https://github.com/nvim-telescope/telescope.nvim
-- - https://github.com/nvim-telescope/telescope-fzf-native.nvim
-- - https://github.com/nvim-telescope/telescope-ui-select.nvim

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },
  config = function()
    require('config.telescope')
  end,
}
