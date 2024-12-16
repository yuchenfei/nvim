return {
  { -- catppuccin
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    opts = require('config.ui.catppuccin'),
  },
  { -- mini.icons
    'echasnovski/mini.icons',
    opts = require('config.ui.mini-icons').opts,
    init = require('config.ui.mini-icons').init,
    specs = {
      { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
    },
  },
  { -- bufferline
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    keys = require('config.keys').bufferline,
    opts = require('config.ui.bufferline'),
  },
  { -- statusline
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = require('config.ui.lualine'),
  },
  { -- noice: replaces the UI for messages, cmdline and the popupmenu.
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = require('config.ui.noice'),
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },
  { -- indent-blankline: add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    main = 'ibl',
    opts = require('config.ui.indent-blankline'),
  },
  { -- mini.indentscope: visualize and work with indent scope
    'echasnovski/mini.indentscope',
    event = 'VeryLazy',
    opts = require('config.ui.mini-indentscope'),
  },
  { -- rainbow-delimiters
    'HiPhish/rainbow-delimiters.nvim',
    event = 'VeryLazy',
    main = 'rainbow-delimiters.setup',
    opts = require('config.ui.rainbow-delimiters'),
  },
}
