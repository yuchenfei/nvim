return {
  { -- https://github.com/folke/snacks.nvim
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      lazygit = { configure = false }, -- use custom config
      quickfile = { enabled = true },
    },
  },
  { import = 'plugins.ui' },
  { import = 'plugins.tools' },
  { import = 'plugins.editor' },
  { import = 'plugins.code' },
}
