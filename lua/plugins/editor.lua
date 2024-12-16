return {
  { -- flash: navigate code with search labels, enhanced character motions
    'folke/flash.nvim',
    event = 'VeryLazy',
    keys = require('config.keys').flash,
    opts = require('config.editor.flash'),
  },
  { -- gitsigns: adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    opts = require('config.editor.gitsigns'),
  },
  { -- mini.ai: better Around/Inside textobjects
    'echasnovski/mini.ai',
    event = 'VeryLazy',
    config = require('config.editor.mini-ai').config,
  },
  { -- mini.pairs
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    opts = {},
  },
  { -- mini.surround: add/delete/replace surroundings (brackets, quotes, etc.)
    'echasnovski/mini.surround',
    event = 'VeryLazy',
    opts = require('config.editor.mini-surround'),
  },
  { -- todo-comments: highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VeryLazy',
    keys = require('config.keys').todocomments,
    opts = require('config.editor.todo-comments'),
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  { -- vim-sleuth: detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth', -- https://github.com/tpope/vim-sleuth
    event = 'VeryLazy',
  },
  { -- nvim-treesitter: highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = require('config.editor.nvim-treesitter'),
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'VeryLazy',
    opts = require('config.editor.nvim-treesitter-context'),
  },
}
