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
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function() return vim.fn.executable('make') == 1 end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    config = require('config.tool.telescope'),
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    keys = require('config.keys').copilotchat,
    opts = {},
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'nvim-lua/plenary.nvim' },
    },
  },
}
