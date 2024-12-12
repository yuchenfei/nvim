return {
  { -- neo-tree
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    event = 'VeryLazy',
    keys = require('config.keys').neotree,
    opts = require('config.tool.neo-tree'),
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },
  { -- which-key
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = require('config.tool.which-key'),
  },
}
