return {
  { -- flash: navigate code with search labels, enhanced character motions
    'folke/flash.nvim',
    lazy = true,
    event = 'VeryLazy',
    keys = require('config.keys').flash,
    opts = require('config.editor.flash'),
  },
  { -- gitsigns: adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = require('config.editor.gitsigns'),
  },
  { -- mini.ai: better Around/Inside textobjects
    'echasnovski/mini.ai',
    lazy = true,
    event = 'VeryLazy',
    opts = require('config.editor.mini-ai'),
  },
  { -- mini.pairs
    'echasnovski/mini.pairs',
    lazy = true,
    event = 'VeryLazy',
    opts = {},
  },
  { -- mini.surround add/delete/replace surroundings (brackets, quotes, etc.)
    'echasnovski/mini.surround',
    lazy = true,
    event = 'VeryLazy',
    opts = require('config.editor.mini-surround'),
  },
  { -- todo-comments: highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    lazy = true,
    event = 'VeryLazy',
    keys = require('config.keys').todocomments,
    opts = require('config.editor.todo-comments'),
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  { -- vim-sleuth: Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth', -- https://github.com/tpope/vim-sleuth
    lazy = true,
    event = 'VeryLazy',
  },
}
