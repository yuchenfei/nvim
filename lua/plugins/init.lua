return {
  { -- https://github.com/folke/snacks.nvim
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
  },
  { import = 'plugins.ui' },
  { import = 'plugins.tools' },
  { import = 'plugins.editor' },
  { import = 'plugins.code' },
}
